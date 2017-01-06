class RemoveSpreePaymentMethodStoreCredits < ActiveRecord::Migration
  def up
    Spree::PaymentMethod.find_by(type: 'Spree::PaymentMethod::StoreCredit', name: 'Store Credit').try(&:destroy)
  end

  def down
    # Reload to pick up new position column for acts_as_list
    Spree::PaymentMethod.reset_column_information
    Spree::PaymentMethod::StoreCredit.find_or_create_by(name: 'Store Credit', description: 'Store Credit',
      active: true, display_on: 'back_end')
  end
end
