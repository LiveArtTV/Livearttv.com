Spree::Admin::RootController.class_eval do
  def index
    if spree_current_user.has_spree_role? 'demo'
      redirect_to spree.admin_products_path
    else
      redirect_to admin_root_redirect_path
    end
  end
end