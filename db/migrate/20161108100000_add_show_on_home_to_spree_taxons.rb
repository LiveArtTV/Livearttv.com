class AddShowOnHomeToSpreeTaxons < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :show_on_home, :boolean, default: false
    add_index  :spree_taxons, :show_on_home
  end
end
