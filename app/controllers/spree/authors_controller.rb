module Spree
  class AuthorsController < Spree::StoreController
    before_action :load_author, only: :show

    respond_to :html

    def index
      @authors = Spree::Author.all.page(params[:page]).per(20)
    end

    def show

    end

    private
    def load_author
      @author = Spree::Author.find_by_slug(params[:id])
    end
  end
end
