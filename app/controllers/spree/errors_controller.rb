module Spree
  class ErrorsController < Spree::StoreController
    layout 'spree/layouts/spree_application'
    respond_to :js, :html

    def not_found
      render status: :not_found
    end

    def internal_server_error
      render status: :internal_server_error
    end

    def unprocessable_entity
      render status: :unprocessable_entity
    end
  end
end
