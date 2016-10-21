Spree::BaseHelper.module_eval do
  def taxons_tree(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.leaf?
    content_tag :ul, class: 'listSidebar list-unstyled' do
      taxons = root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : ''
        content_tag :li, class: css_class do
          link_to(taxon.name, seo_url(taxon), class: css_class, title: taxon.name) + taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end
      safe_join(taxons, "\n")
    end
  end
end
