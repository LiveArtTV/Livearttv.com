module Spree
  class LandingsController < ApplicationController
    include Spree::Core::ControllerHelpers::Store
    helper 'spree/products'
    def index
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @taxon_roots = Spree::Taxon.all
    end
  end
end
