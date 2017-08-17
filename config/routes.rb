Rails.application.routes.draw do
  if Rails.env.production?
    match '/', to: 'spree/landings#index', via: 'get'
  end
  mount Spree::Core::Engine, at: '/'
end

Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    put 'products/:id/set_available', to: 'products#set_available', as: :make_product_available
    put 'products/:id/set_unavailable', to: 'products#set_unavailable', as: :set_unavailable_product
  end
end


Spree::Core::Engine.routes.append do
  namespace :admin, path: Spree.admin_path do
    resources :authors, path: 'artists' do
      resources :images, controller: :author_images do
        collection do
          post :update_positions
        end
      end
      resources :videos, path: 'library'
    end
  end

  resources :authors, only: [:index, :show], path: 'artists'
  resources :taxons do
    collection do
      get :products
    end
  end
  resources :videos, path: 'library' do
    collection do
      get :items
    end
  end
  get  'pages/contact_us'
  get  'pages/contact_artist'
  get  'pages/about_us', controller: 'pages', action: 'about_us'
  get  'pages/auctions', controller: 'pages', action: 'auctions'
  post 'pages/contact_us', controller: 'pages', action: 'contact_us_send'
  post 'pages/contact_artist', controller: 'pages', action: 'contact_artist_send'
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
end
