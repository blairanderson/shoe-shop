class Post < ActiveRecord::Base
  is_impressionable counter_cache: true
  acts_as_votable

  as_enum :status, [:draft, :for_sale, :sold, :deleted], 
  :whiny => false, :column => 'status_enum'

  validates :title,       presence: true, length: { maximum: 50 }
  validates :price,       presence: true, numericality: true
  validates :body,        presence: true
  validates :brand,       presence: true
  validates :status_enum, presence: true

  belongs_to :user
  validates_associated :user, :if => :user_id

  belongs_to :size
  validates_presence_of :size
  validates_associated :size, :if => :size_id

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :watched_items, dependent: :destroy
  has_many :watchers, through: :watched_items, source: :user

  alias_attribute :score, :cached_votes_score 
  alias_attribute :view_count, :impressions_count 

  before_validation :set_default_enum

  def set_default_enum
    if status.nil?
      self.status = :draft
    end
  end

  scope :inactive,     -> { where(status_enum: Post.draft) }
  scope :active,  -> { where(status_enum: Post.for_sale) }
  scope :depleted,      -> { where(status_enum: Post.sold) }
  scope :removed,   -> { where(status_enum: Post.deleted) }

  scope :top,  ->  { order("cached_votes_score DESC") }
  scope :bottom, ->  { order("cached_votes_score ASC") }
  scope :oldest, ->  { order("created_at ASC") }
  scope :newest, ->  { order("created_at DESC") }
  
  scope :sml, ->  { where(:size_id => [1,2,3,4,5,6,7]) } # 'nine-and-under'
  scope :med, ->  { where(size_id: [8,9]) }# 'nine5-to-10'
  scope :lrg, ->  { where(size_id: [10,11]) }# 'ten5-to-eleven'
  scope :xl, ->  { where(size_id: [12,13,14,15,16,17,18,19]) } # 'eleven5_plus' 

  def self.filter(filter)
    self.send(filter)
  end

  def to_param
    "#{id} #{brand} #{title}".parameterize
  end

  def valid_statuses
    statuses = Post.statuses.dup
    case status
    when :draft
      statuses.extract!(:draft, :for_sale, :deleted)
    when :deleted
      statuses.extract!(:deleted, :draft)
    when :sold
      statuses.extract!(:sold, :for_sale, :draft)
    when :for_sale
      statuses.extract!(:for_sale, :draft, :sold)
    end
  end
  
end
