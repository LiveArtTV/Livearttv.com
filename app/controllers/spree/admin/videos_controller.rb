module Spree
  module Admin
    class VideosController < ResourceController

      def index

      end

      def show
        redirect_to admin_videos_path
      end
    end
  end
end
