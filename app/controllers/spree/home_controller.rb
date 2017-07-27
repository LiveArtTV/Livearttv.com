module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products.includes(:possible_promotions)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @videos = Spree::Video.stream_or_home_videos
      @sample_products = sample_products
      @taxon_roots = Spree::Taxon.all
    end

    private
    def sample_products
      Spree::Taxon.find_each.with_object({}) do |taxon, samples|
        if !samples[taxon.taxonomy] && taxon.products.any?
          samples[taxon.taxonomy] = taxon.products.sample
        end
      end
    end
  end
end
