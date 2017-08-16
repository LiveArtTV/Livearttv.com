Spree::Admin::ProductsController.class_eval do

  DATA_COLUMNS = [:name, {:author => [:name]}, :price, :price_type, :id, :created_at, :description, :description_short,
  :available_on, :discontinue_on, :promotionable, :shipping_category_id, :tax_category_id, :meta_description,
  :meta_keywords, :meta_title, :slug, :updated_at, {:images => [:first => [:url_with_host]]}]

  HEADER_COLUMNS = ['Name', 'Author', 'Price', 'Price_type', 'ID', 'Created', 'Description', 'Description_short',
  'Available_on', 'Discontinue_on', 'Promotionable', 'shipping_category_id', 'tax_category_id', 'meta_description',
   'meta_keywords', 'meta_title', 'slug', 'Updated_at', 'Image']

  def index
    respond_to do |format|
      format.html { render :index }
      format.xls do
        @products = Spree::Product.all
        send_data @products.to_xls(:columns => DATA_COLUMNS, :headers => HEADER_COLUMNS), :filename => 'products.xls'
      end
    end
  end

  def set_unavailable
    #@product = Spree::Product.find(:id)
    @product.available_on = nil
    @product.save!
    redirect_to admin_products_path
  end

  def set_available
    #@product = Spree::Product.find(:id)
    @product.available_on = Time.now
    @product.save!
    redirect_to admin_products_path
  end

  def product_includes
    [{ variants: [:images], master: [:images, :default_price] }, :author]
  end
end
