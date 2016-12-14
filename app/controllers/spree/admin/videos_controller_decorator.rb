Spree::Admin::VideosController.class_eval do

  private
  def load_data
    @product = Spree::Product.find_by(slug: params[:product_id] || (params[:video] && params[:video][:product_id]))
    @author  = Spree::Author.find_by(id: params[:author_id] || (params[:video] && params[:video][:author_id]))
  end

  def set_product
    @video.watchable = @product || @author
  end
end