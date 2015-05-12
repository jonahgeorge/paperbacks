class RenameEmailConfirmationToConfirmed < ActiveRecord::Migration
  def change
    rename_column :users, :email_confirmation, :confirmed
  end
end
