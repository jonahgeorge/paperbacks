class CreateTerm < ActiveRecord::Migration
  def change
    create_table :terms, primary_key: false do |t|
      t.string :id
      t.string :name
      t.timestamps
    end
  end
end
