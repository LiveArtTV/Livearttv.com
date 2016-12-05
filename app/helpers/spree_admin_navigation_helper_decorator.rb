Spree::Admin::NavigationHelper.module_eval do

  def link_to_delete(resource, options={})
    url = options[:url] || object_url(resource)
    name = options[:name] || Spree.t(:delete)
    options[:class] = "btn btn-danger btn-sm delete-resource"
    options[:data] = { confirm: Spree.t(:are_you_sure), action: 'remove', method: 'delete' }
    link_to_with_icon 'delete', name, url, options
  end
end
