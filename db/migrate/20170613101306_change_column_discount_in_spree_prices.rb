class ChangeColumnDiscountInSpreePrices < ActiveRecord::Migration
  def change
    change_column :spree_prices, :discount, :decimal, precision: 10, scale: 2, default: 0
  end
end
