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
end
