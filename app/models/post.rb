class Post < ActiveRecord::Base
  max_paginates_per 28

  alias_attribute :score, :cached_votes_score
  alias_attribute :view_count, :impressions_count

  before_validation :set_default_enum

  as_enum :status, [:draft, :for_sale, :sold, :deleted],
          whiny: false, column: 'status_enum'

  validates :user_id,     presence: true
  validates :title,       presence: true, length: {maximum: 80}
  validates :price,       presence: true, numericality: true
  validates :body,        presence: true
  validates :scoreboard,  presence: true
  validates :status_enum, presence: true

  validate :for_sale_images_count, if: :for_sale?
  def for_sale_images_count
    errors.add(:images_count, "Must have images to sell these shoes.") if images.count == 0
  end

  belongs_to :user
  validates_associated :user, if: :user_id

  belongs_to :size
  validates_presence_of :size
  validates_associated :size, if: :size_id

  has_one :paypal_callback
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy

  def set_default_enum
    if status.nil?
      self.status = :draft
    end
  end

  def self.filter(filter)
    self.send(filter)
  end

  def self.sort(sort)
    self.send(sort)
  end

  scope :with_images, -> { where.not(images_count: 0) }
  scope :drafted, -> { where(status_enum: Post.draft) }
  scope :active, -> { where(status_enum: Post.for_sale).with_images }
  scope :inactive, -> { where(status_enum: Post.sold) }
  scope :removed, -> { where(status_enum: Post.deleted) }

  scope :top, -> { order(cached_votes_score: :desc, created_at: :desc) }
  scope :bottom, -> { order(cached_votes_score: :asc, created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  scope :newest, -> { order(created_at: :desc) }
  scope :random, -> { order(scoreboard: :desc, created_at: :desc) }

  scope :sml, -> { where(size_id: [1, 2, 3, 4, 5, 6, 7]) } # 'nine-and-under'
  scope :med, -> { where(size_id: [8, 9]) } # 'nine5-to-10'
  scope :lrg, -> { where(size_id: [10, 11]) } # 'ten5-to-eleven'
  scope :xl, -> { where(size_id: [12, 13, 14, 15, 16, 17, 18, 19]) } # 'eleven5_plus'


  def update_scoreboard
    board = {created_at: created_at, votes_up: cached_votes_up, votes_down: cached_votes_down}
    result = Scoreboard.new(board).result
    update scoreboard: result
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  def valid_statuses
    Post.statuses.dup
  end

  def send_notifications
    if for_sale? and Rails.env.production?
      service = TCO.new
      service.post_update(self)
    end
  end
end
