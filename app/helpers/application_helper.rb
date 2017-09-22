module ApplicationHelper
  def store_block?
    ! %w(user_sessions users).include?(controller_name)
  end

  def slider_block?
    %w(home).include?(controller_name)
  end

  def product_property(product_properties, property = :vendor)
    return '' unless product_properties
    product_properties.select{|prop| prop.property.name.downcase == property.to_s }.first.try(:value)
  end

  def product_image_src(product, style = nil)
    if product.images.empty?
      asset_path('product_default.png')
    else
      product.images.first.attachment.url(style)
    end
  end

  def author_dates(author)
    res = []
    res << "#{author.year_of_birth}" if author.year_of_birth
    res << "#{author.year_of_death}" if author.year_of_death
    res.join(' - ')
  end

  # @size [:default | :medium | :high]
  def spree_video_thumb_uri(video, size = :high)
    thumb_yt_sizes = {
        default: 'default',
        medium:  'mqdefault',
        high:    'hqdefault',
        sd:      'sddefault',
        orig:    'maxresdefault'
    }
    "http://img.youtube.com/vi/#{video.youtube_ref}/hqdefault.jpg"
  end

  def arrow(sort_by)
    sort_by.end_with?('_desc') ? 'fa-long-arrow-up' : 'fa-long-arrow-down'
  end


  def video_link
    search_stream = @videos.find_by stream: true
    if search_stream
       search_stream
    else
      @videos.find_by show_on_home: true
    end
  end

  def product_price_variations
    result = nil
    if @product.real_price?
      result = display_price(@product)
    end
    if @product.not_sale?
      result = Spree.t(:not_for_sale)
    end
    if @product.request_price?
      result = link_to Spree.t(:price_by_request), pages_contact_us_path
    end
   result
  end
end
