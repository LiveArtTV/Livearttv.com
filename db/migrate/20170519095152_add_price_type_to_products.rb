class AddPriceTypeToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :price_type, :integer
  end
end
