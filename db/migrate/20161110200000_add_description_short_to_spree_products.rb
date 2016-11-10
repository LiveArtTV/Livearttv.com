class AddDescriptionShortToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :description_short, :string, default: '', length: 255, after: :description
  end
end