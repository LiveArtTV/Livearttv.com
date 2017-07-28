class ApplicationController < ActionController::Base
  before_action :redirect_to_landing
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Globals::ErrorPages

  def redirect_to_landing
    return unless Rails.env.production?
    path = request.fullpath
    if ['/', '/login'].exclude?(path)
      unless current_spree_user&.admin?
        redirect_to root_path
      end
    end
  end
end
