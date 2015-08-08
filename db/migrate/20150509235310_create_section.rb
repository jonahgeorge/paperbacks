class CreateSection < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :instructor
      t.references :course, index: true

      t.timestamps
    end
  end
end
