class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :isbn
  validates_uniqueness_of :isbn

  belongs_to :section
  has_many :listings

  scope :where_title_like, ->(title) {
    where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
  }

  def active_listings
    self.listings.where(is_active: true)
  end

  def inactive_listings
    self.listings.where(is_active: false)
  end
end
