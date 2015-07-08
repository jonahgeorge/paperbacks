class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :token, allow_nil: true
  validates_acceptance_of :terms_of_service

  before_create :generate_token

  has_many :listings

  scope :where_name_like, ->(name) {
    where('name LIKE ?', "%#{name}%")
  }

  def active_listings
    self.listings.where(is_active: true)
  end

  def inactive_listings
    self.listings.where(is_active: false)
  end

  private

  def generate_token
    token = nil
    loop do
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      break if User.where(token: token).count == 0
    end
    self.token = token
  end
end
