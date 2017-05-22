Spree::Product.class_eval do
  belongs_to :author
  enum price_type: [ :real_price, :not_sale, :request_price ]

    #with_options presence: true do
      #validates :name, :shipping_category
      #validates :price, if: proc { Spree::Config[:require_master_price] }
    #end

  def is_real_price?
  end
end