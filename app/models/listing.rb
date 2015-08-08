class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :user
  validates_presence_of :book
  validates_presence_of :price
  validates_numericality_of :price, greater_than_or_equal_to: 0

  def self.by_title(title)
    joins(:book).where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
  end

  def self.active
    where(active: true)
  end

  def self.inactive
    where(active: false)
  end
end
