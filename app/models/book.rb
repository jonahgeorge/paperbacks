class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :isbn
  validates_uniqueness_of :isbn

  belongs_to :section
  has_many :listings

  def self.by_title(title)
    where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
  end
end
