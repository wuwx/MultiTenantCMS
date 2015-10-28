Rails.application.routes.draw do

  root 'sites#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users

  namespace :admin do
    root 'posts#index'
    resources :comments, :links, :pages, :posts, :sites, :users
    resources :themes
  end

  namespace :settings do
    resources :sites
  end

  resources :sites, path: '', only: [:show] do
    scope module: 'sites' do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:create]
      end
      resources :links
      namespace :settings do
        get "/" => 'posts#index'
        resources :posts, :categories, :tags
        resources :links, :pages
        resources :comments, only: [:index, :show, :destroy]
      end
      resources :pages, path: '', only: [:show] do
        resources :comments, only: [:create]
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
