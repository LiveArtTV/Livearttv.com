class AddDiscountToPrices < ActiveRecord::Migration
  def up
    add_column :spree_prices, :discount, :decimal, precision: 10, scale: 2
    add_column :spree_prices, :old_amount, :decimal, precision: 10, scale: 2
    Spree::Price.update_all(discount: 0)
    Spree::Price.update_all('old_amount=amount')
  end

  def down
    remove_column :spree_prices, :discount
    remove_column :spree_prices, :old_amount
  end
end
