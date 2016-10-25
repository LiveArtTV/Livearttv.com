class AddAuthorIdToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :author_id, :integer
    add_index  :spree_products, :author_id
  end
end
