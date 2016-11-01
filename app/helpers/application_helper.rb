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

  def product_image_src(product)
    if product.images.empty?
      if !product.is_a?(Spree::Variant) && !product.variant_images.empty?
        product.variant_images.first.attachment.url
      else
        if product.is_a?(Variant) && !product.product.variant_images.empty?
          product.product.variant_images.first.attachment.url
        else
          asset_path('product_default.png')
        end
      end
    else
      product.images.first.attachment.url
    end
  end
end
