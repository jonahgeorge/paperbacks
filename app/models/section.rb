class Section < ActiveRecord::Base
  self.primary_key = "id"
  has_many :books
end
