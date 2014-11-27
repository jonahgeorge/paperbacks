class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.integer :price

      t.timestamps
    end
  end
end
