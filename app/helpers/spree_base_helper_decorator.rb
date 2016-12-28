Spree::BaseHelper.module_eval do
  def taxons_tree(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.try(:leaf?)
    content_tag :ul, class: 'listSidebar list-unstyled' do
      taxons = root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : ''
        content_tag :li, class: css_class do
          link_to("#{taxon.name} #{content_tag :span, taxon.products.count, class: 'apolloQty pull-right'}".html_safe, seo_url(taxon), class: css_class, title: taxon.name) + taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end
      safe_join(taxons, "\n")
    end
  end
  # def product_image_src(product)
  #   if product.images.empty?
  #     if !product.is_a?(Spree::Variant) && !product.variant_images.empty?
  #       product.variant_images.first.attachment.url
  #     else
  #       if product.is_a?(Variant) && !product.product.variant_images.empty?
  #         product.product.variant_images.first.attachment.url
  #       else
  #         asset_path('product_default.png')
  #       end
  #     end
  #   else
  #     product.images.first.attachment.url
  #   end
  # end
end
