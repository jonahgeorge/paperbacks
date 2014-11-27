class AddActiveToListings < ActiveRecord::Migration
  def change
    add_column(:listings, :is_active, :boolean)
  end
end
