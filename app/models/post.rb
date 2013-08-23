class Post < ActiveRecord::Base
  is_impressionable counter_cache: true
  acts_as_votable

  validates :title,   presence: true, length: { maximum: 50 }
  validates :price,   presence: true
  validates :body,    presence: true
  validates :brand,   presence: true

  belongs_to :user
  validates_associated :user, :if => :user_id

  validates_presence_of :size
  belongs_to :size
  validates_associated :size, :if => :size_id

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :watched_items, dependent: :destroy
  has_many :watchers, through: :watched_items, source: :user

  alias_attribute :score, :cached_votes_score 
  alias_attribute :view_count, :impressions_count 

  scope :active, ->  { where(visible: true) }
  scope :inactive, -> { where(visible: false) }

  scope :top,  ->  { order("cached_votes_score DESC") }
  scope :bottom, ->  { order("cached_votes_score ASC") }
  scope :oldest, ->  { order("created_at ASC") }
  scope :newest, ->  { order("created_at DESC") }
  # 'nine-and-under'
  scope :sml, ->  { where(:size_id => [1,2,3,4,5,6,7]) }
  # 'nine5-to-10'
  scope :med, ->  { where(size_id: [8,9]) }
  # 'ten5-to-eleven'
  scope :lrg, ->  { where(size_id: [10,11]) }
  # 'eleven5_plus'
  scope :xl, ->  { where(size_id: [12,13,14,15,16,17,18,19]) }

  def self.filter(filter)
    self.send(filter)
  end

  def post_title
    begin
      "#{title}, size: #{size.name} | @ #{price}"
    rescue Exception => e
      self.size = Size.first
      self.save
      "#{title}, size: #{size.name} | @ #{price}"
    end
  end

  def status
    if visible
      "Post is Visible"
    else
      "Post is Not Visible"
    end
  end

  def to_param
    "#{id} #{brand} #{title}".parameterize
  end
  
end
