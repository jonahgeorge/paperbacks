class CreateSection < ActiveRecord::Migration
  def change
    create_table :sections, primary_key: false do |t|
      t.string :id
      t.string :name
      t.string :instructor
      t.string :course_id
      t.timestamps
    end
  end
end
