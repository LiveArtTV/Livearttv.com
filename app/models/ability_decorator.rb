class AbilityDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= Spree.user_class.new
    if user.has_spree_role? 'demo'
      # can :manage, Spree::Order
      can :manage, Spree::Product
      can :manage, Spree::ProductProperty
      can :manage, Spree::Property
      can :manage, Spree::OptionType
      can :manage, Spree::OptionValue
      can :manage, Spree::Taxon
      can :manage, Spree::Taxonomy
      can :manage, Spree::Variant
      can :manage, [Spree::Author, Spree::AuthorImage]
      can :manage, Spree::Video
      # can :admin, [Spree::ReturnAuthorization,Spree::CustomerReturn]
      # can :admin, Spree::Admin::ReportsController
      # can :admin, Spree::Promotion

      can :manage, Spree::Store.current
      can :manage, Spree::Config
      # can :manage, Spree::TaxCategory
      # can :manage, Spree::TaxRate
      # can :manage, Spree::Zone
      # can :manage, Spree::Country
      # can :manage, Spree::PaymentMethod
      # can :manage, Spree::ShippingMethod
      # can :manage, Spree::ShippingCategory
      # can :manage, Spree::StockTransfer
      # can :manage, Spree::StockLocation
      # can :manage, Spree::StoreCreditCategory
      # can :manage, Spree::Tracker
      # can :manage, Spree::RefundReason
      # can :manage, Spree::ReimbursementType
      # can :manage, Spree::ReturnAuthorizationReason
      # can :manage, Spree::Role

      # can :manage, Spree.user_class
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)