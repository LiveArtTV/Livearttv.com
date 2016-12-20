Spree::FrontendHelper.module_eval do
  def breadcrumbs(model, separator="&nbsp;")
    return "" if current_page?("/") || model.nil?
    separator = raw(separator)
    crumbs = [content_tag(:li, content_tag(:span, link_to(content_tag(:span, Spree.t(:home), itemprop: "name"), spree.root_path, itemprop: "url") + separator, itemprop: "item"), itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")]

    if model.is_a?(Spree::Taxon)
      # crumbs << content_tag(:li, content_tag(:span, link_to(content_tag(:span, Spree.t(:products), itemprop: "name"), spree.products_path, itemprop: "url") + separator, itemprop: "item"), itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
      crumbs << model.ancestors.collect { |ancestor| content_tag(:li, content_tag(:span, link_to(content_tag(:span, ancestor.name, itemprop: "name"), seo_url(ancestor), itemprop: "url") + separator, itemprop: "item"), itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement") } unless model.ancestors.empty?
      crumbs << content_tag(:li, content_tag(:span, link_to(content_tag(:span, model.name, itemprop: "name") , seo_url(model), itemprop: "url"), itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
    elsif model.is_a?(Spree::Product)
      # crumbs << content_tag(:li, content_tag(:span, Spree.t(:products), itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
    elsif model.to_s.include?(Spree::Author.to_s)
      crumbs << content_tag(:li, content_tag(:span, link_to_if(!model.try(:count), content_tag(:span, Spree.t(:authors), itemprop: "name"), authors_path, itemprop: "url") + separator, itemprop: "item"), itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
      crumbs << content_tag(:li, content_tag(:span, model.name, itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement") unless model.try(:count)
    elsif model.to_s.include?(Spree::Video.to_s)
      crumbs << content_tag(:li, content_tag(:span, link_to_if(!model.try(:count), content_tag(:span, Spree.t(:videos), itemprop: "name"), videos_path, itemprop: "url") + separator, itemprop: "item"), itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
      crumbs << content_tag(:li, content_tag(:span, model.title, itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement") unless model.try(:count)
    elsif model.is_a?(Spree::Page)
      crumbs << content_tag(:li, content_tag(:span, model.title, itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
    elsif model.is_a?(OpenStruct)
      crumbs << content_tag(:li, content_tag(:span, model.title, itemprop: "item"), class: 'active', itemscope: "itemscope", itemtype: "https://schema.org/ListItem", itemprop: "itemListElement")
    end
    crumb_list = content_tag(:ol, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'breadcrumb', itemscope: "itemscope", itemtype: "https://schema.org/BreadcrumbList")
    content_tag(:nav, crumb_list, class: 'breadcrumbs', 'aria-label' => "breadcrumbs")
  end

  def product_description_short(product)
    description = if Spree::Config[:show_raw_product_description]
                    product.description_short
                  else
                    product.description_short.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                  end
    description.blank? ? Spree.t(:product_has_no_description) : raw(description)
  end
end
