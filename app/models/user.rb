class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :email_token, allow_nil: true

  before_create :generate_email_token

  has_many :listings

  scope :with_name, ->(name) {
    where('name LIKE ?', "%#{name}%")
  }

  def active_listings
    self.listings.where(is_active: true)
  end

  def inactive_listings
    self.listings.where(is_active: false)
  end

  private

  def generate_email_token
    token = nil

    loop do
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      break if User.where(email_token: token).count == 0
    end

    self.email_token = token
  end

end
