Spree::Variant.class_eval do
	delegate_belongs_to :default_price, :discount
	delegate_belongs_to :default_price, :price_before_discount
end