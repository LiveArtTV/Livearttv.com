Spree::Image.class_eval do

  def url_with_host
    "#{ActionController::Base.asset_host}#{mini_url}"
  end
end
