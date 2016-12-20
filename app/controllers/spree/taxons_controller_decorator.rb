Spree::TaxonsController.class_eval do
  respond_to :html, :js

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

  def show
    @taxon = Spree::Taxon.friendly.find(params[:id])
    return unless @taxon

    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    session[:taxons_view] = params[:view] if %w(list grid).include?(params[:view])
    @taxons_view = session[:taxons_view] || params[:view] || 'list'

    respond_to do |format|
      format.html do
        render 'spree/taxons/show'
      end
      format.js do
        if @taxons_view == 'grid'
          render 'spree/taxons/grid', locals: { products: @products, taxon: @taxon }
        else
          render 'spree/taxons/list', locals: { products: @products, taxon: @taxon }
        end
      end
    end

  end
end