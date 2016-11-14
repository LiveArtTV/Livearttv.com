module Spree
  module Admin
    class AuthorImagesController < ResourceController
      before_action :load_data

      create.before :set_viewable
      update.before :set_viewable

      private

      def location_after_destroy
        admin_author_images_url(@author)
      end

      def location_after_save
        admin_author_images_url(@author)
      end

      def load_data
        @author = Author.find(params[:author_id])
      end

      def set_viewable
        @author_image.viewable_type = 'Spree::Author'
        @author_image.viewable_id = params[:author_image][:viewable_id]
      end

      def author_index_includes
        [
            author_images: [viewable: { option_values: :option_type }]
        ]
      end

      def author_edit_includes
        [
            author_images: { option_values: :option_type, images: :viewable }
        ]
      end
    end
  end
end
