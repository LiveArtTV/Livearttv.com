Spree::BaseController.class_eval do
  include Globals::ErrorPages

  def render_404
    raise ActiveRecord::RecordNotFound
  end
end
