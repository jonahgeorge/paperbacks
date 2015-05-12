class RenameEmailTokenToToken < ActiveRecord::Migration
  def change
    rename_column :users, :email_token, :token
  end
end
