class Book < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :isbn
  validates_uniqueness_of :isbn
  
  has_many :listings
  
  scope :with_title, ->(title) {
    # where('name LIKE ?', "%#{name}%")
  }
  
  # def active_listings
  #
  # end
  #
  # def inactive_listings
  #
  # end
  
end
