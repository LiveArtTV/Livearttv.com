module Globals
  module ErrorPages
    extend ActiveSupport::Concern
    included do
      unless Rails.env.development?
        rescue_from ActiveRecord::DeleteRestrictionError,
                    ActiveRecord::RecordInvalid,
                    ActionView::MissingTemplate do |exception|
          #notify_airbrake(exception)
            binding.pry
          if request.xhr?
            render nothing: true, status: 500
          else
            render template: 'errors/internal_server_error', layout: 'error', status: 500
          end
        end

        rescue_from ActiveRecord::RecordNotFound,
                    ActionController::RoutingError do |_exception|
                      binding.pry
          if request.xhr?
            render nothing: true, status: 404
          else
            binding.pry
            render template: 'errors/not_found', layout: 'error', status: 404
          end
        end
      end
    end
  end
end
