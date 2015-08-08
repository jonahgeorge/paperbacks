class CreateTerm < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name

      t.timestamps
    end
  end
end
