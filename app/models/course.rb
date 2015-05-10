class Course < ActiveRecord::Base
  self.primary_key = "id"
  has_many :sections
end
