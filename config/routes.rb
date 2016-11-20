Rails.application.routes.draw do
  get  'pages/contact_us'
  post 'pages/contact_us', controller: 'pages', action: 'contact_us_send'

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
    end
    resources :videos
  end
  resources :authors, only: [:index, :show]
end
