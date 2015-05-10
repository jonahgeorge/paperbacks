class Term < ActiveRecord::Base
  self.primary_key = "id"
  has_many :departments
end
