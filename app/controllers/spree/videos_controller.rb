module Spree
  class VideosController < Spree::StoreController
    respond_to :html
    PER_PAGE = 20

    def index
      @videos = Video.all
      if params[:sortby]
        @videos =
          case params[:sortby]
          when 'date'
            @videos.orderby :created_at
          when 'date_desc'
            @videos.orderby [:created_at, :desc]
          when 'author'
            @videos.orderby :author
          when 'author_desc'
            @videos.orderby [:author, :desc]
          when 'title'
            @videos.orderby :title
          when 'title_desc'
            @videos.orderby [:title, :desc]
        end
      end
      if params[:keywords] && params[:category].present?
        @videos =
          case params[:category]
            # when 'author'
            #   @videos.joins(:authors).where("#{Spree::Author.table_name.to_s}.name LIKE ?","#{params[:keywords]}%")
            when 'title'
              @videos.where('title LIKE ?',"#{params[:keywords]}%")
          end
      end
      @videos = @videos.page(params[:page]).per(PER_PAGE)
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
