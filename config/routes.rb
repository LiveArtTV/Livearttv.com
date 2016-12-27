Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
end

Spree::Core::Engine.routes.append do
  namespace :admin, path: Spree.admin_path do
    resources :authors do
      resources :images, controller: :author_images do
        collection do
          post :update_positions
        end
      end
      resources :videos
    end
  end
  resources :authors, only: [:index, :show]
  resources :taxons do
    collection do
      get :products
    end
  end
  resources :library, controller: 'videos' do
    collection do
      get :all, action: 'index'
      get :items
    end
  end
  get  'pages/contact_us'
  post 'pages/contact_us', controller: 'pages', action: 'contact_us_send'
end
