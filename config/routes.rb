Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
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
  post 'pages/contact_us', controller: 'pages', action: 'contact_us_send'
end
