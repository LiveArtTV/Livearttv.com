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
    res = author.year_of_birth
    res += raw("&nbsp;-&nbsp;#{author.year_of_death}") if author.year_of_death
    res
  end
end
