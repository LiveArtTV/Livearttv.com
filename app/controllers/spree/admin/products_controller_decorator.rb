Spree::Admin::ProductsController.class_eval do

  def index
    respond_to do |format|
      format.html { render :index }
      format.xls do
        @products = Spree::Product.all
        send_data @products.to_xls(:columns =>
          [
          :name,
          {:author => [:name]},
          :price,
          :price_type,
          :id,
          :created_at,
          :description,
          :description_short,
          :available_on,
          :discontinue_on,
          :promotionable,
          :shipping_category_id,
          :tax_category_id,
          :meta_description,
          :meta_keywords,
          :meta_title,
          :slug,
          :updated_at
          ],
        :headers => ['Name', 'Author', 'Price', 'Price_type', 'ID', 'Created', 'Description', 'Description_short',
        'Available_on', 'Discontinue_on', 'Promotionable', 'shipping_category_id', 'tax_category_id', 'meta_description',
         'meta_keywords', 'meta_title', 'slug', 'Updated_at']),
        :filename => 'products.xls'
      end
    end
  end
end
