Spree::Price.class_eval do

  attr_writer :price_before_discount
  def price_before_discount
    amount + discount
  end
end