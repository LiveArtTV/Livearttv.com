Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
end

Spree::Core::Engine.routes.append do
  namespace :admin, path: Spree.admin_path do
    resources :authors
  end
end
