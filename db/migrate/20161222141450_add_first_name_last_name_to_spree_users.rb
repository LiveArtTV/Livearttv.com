class AddFirstNameLastNameToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :first_name, :string, limit: 100
    add_column :spree_users, :last_name,  :string, limit: 100
  end
end
