class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, primary_key: false do |t|
      t.string :id
      t.string :name
      t.string :term_id
      t.timestamps
    end
  end
end
