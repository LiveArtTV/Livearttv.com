class AddPriceTypeToProducts < ActiveRecord::Migration

	def up
		add_column :spree_products, :price_type, :integer
		Spree::Product.update_all(price_type: 0) # real_price = 0, not sale = 1, request_price = 2
  end

  def down
    remove_column :spree_products, :price_type
  end
end
