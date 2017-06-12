Spree::Admin::ProductsController.class_eval do

  def index
    Mime::Type.register "application/vnd.ms-excel", :xls
    respond_to do |format|
      format.html { render :index }
      format.xls do
        @products = Spree::Product.all
        send_data @products.to_xls, :filename => 'products.xls'
      end
    end
  end
end
