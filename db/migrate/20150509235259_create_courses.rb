class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, primary_key: false do |t|
      t.string :id
      t.string :name
      t.string :department_id
      t.timestamps
    end
  end
end
