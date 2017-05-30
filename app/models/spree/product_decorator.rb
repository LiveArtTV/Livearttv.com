Spree::Product.class_eval do
  belongs_to :author
  enum price_type: [ :real_price, :not_sale, :request_price ]
end