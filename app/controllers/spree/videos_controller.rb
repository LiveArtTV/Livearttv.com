module Spree
  class VideosController < Spree::StoreController
    respond_to :html, :js
    PER_PAGE = 20

    def index
      @videos = Video.all
      @videos =
        case params[:sortby]
        when 'date'
          @videos.orderby :created_at
        when 'date_desc'
          @videos.orderby [:created_at, :desc]
        when 'artist'
          @videos.includes(:author).orderby('spree_authors.name')
        when 'artist_desc'
          @videos.includes(:author).orderby('spree_authors.name desc')
        when 'title'
          @videos.orderby :title
        when 'title_desc'
          @videos.orderby [:title, :desc]
        else
          @videos.orderby [:created_at, :desc]
        end
      if params[:keywords] && params[:category].present?
        @videos =
          case params[:category]
            when 'author'
              @videos.joins(:author).where("#{Spree::Author.table_name.to_s}.name LIKE ?","#{params[:keywords]}%")
            when 'title'
              @videos.where("#{Spree::Video.table_name.to_s}.title LIKE ?","#{params[:keywords]}%")
          end
      end

      @videos = @videos.page(params[:page]).per(PER_PAGE) if @videos
    end

    def product_index
      @product = Product.find_by(slug: params[:product_id])
      @videos = @product.videos.all(order: 'position')
    end

    def show
      if params[:youtube_ref]
        @video = Video.find_by(youtube_ref: params[:youtube_ref])
      else params[:id]
        @video = Video.find(params[:id])
      end

      # @client = Yt::Client.new
    end

    def items

      if params[:category]
        @json = case params[:category]
          when 'author'
            Author.all.map {|i| i.name}
          when 'title'
            Video.all.map {|i| i.title}
          end
      else
        @json = []
      end
    end
  end
end
