class DropSpreeStoreCredits < ActiveRecord::Migration
  def change
    drop_table :spree_store_credits
    drop_table :spree_store_credit_categories
    drop_table :spree_store_credit_events
    drop_table :spree_store_credit_types
  end
end
