Spree::Product.class_eval do
  belongs_to :author
  enum price_type: [ :real_price, :not_sale, :request_price ]
  delegate_belongs_to :master, :discount
  delegate_belongs_to :master, :price_before_discount
  self.whitelisted_ransackable_associations += %w(author)
end
