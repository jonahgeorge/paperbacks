class AddEmailConfirmationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmation, :boolean
  end
end
