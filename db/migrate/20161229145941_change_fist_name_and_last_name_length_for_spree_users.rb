class ChangeFistNameAndLastNameLengthForSpreeUsers < ActiveRecord::Migration
  def change
    change_column :spree_users, :first_name, :string, limit: 1024
    change_column :spree_users, :last_name,  :string, limit: 1024
  end
end
