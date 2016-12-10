Spree::TaxonsController.class_eval do
  def products
    # Returns the products sorted by their position with the classification
    # Products#index does not do the sorting.
    taxon = Spree::Taxon.find(params[:id])
    @searcher = build_searcher(params.merge(taxon: taxon.id, include_images: false))
    @products = @searcher.retrieve_products
    # @products = taxon.products.ransack(params[:q]).result
    # @products = @products.page(params[:page]).per(500 || params[:per_page])
    # render "spree/api/products/index"
  end
end