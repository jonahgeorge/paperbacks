class User < ActiveRecord::Base
  
  has_secure_password
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
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

end
