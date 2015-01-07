class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable, :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :authentication_keys => [:login]

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  validates :username, uniqueness: {case_sensitive: false}

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :keychain, dependent: :destroy

  scope :with_posts, -> { joins(:posts).having("count(posts) > 0") }

  def self.to_csv
    CSV.generate do |csv|
      # headers
      csv << %w(name email twitter posts_count score created_at)
      all.each do |user|
        csv << [
            user.username,
            user.email,
            user.twitter,
            user.posts.count,
            user.score,
            user.created_at.to_i
        ]
      end
    end
  end

  def update_omniauth(auth)
    self.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.twitter = auth["info"]["nickname"]
      user.keychain = Keychain.from_auth(auth)
      user.save
    end
  end

  def remove_twitter_authentication
    self.provider = nil
    self.uid = nil
    self.twitter = nil
    self.keychain.destroy
    self.save
    self.reload
  end

  def score
    ProfilePresenter.new(self).score
  end
end
