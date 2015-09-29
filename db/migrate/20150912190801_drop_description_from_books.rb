class DropDescriptionFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :description
  end
end
