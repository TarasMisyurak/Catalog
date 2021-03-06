Rails.application.routes.draw do
  get 'cart_items/create'

  get 'cart_items/update'

  get 'cart_items/destroy'

  get 'carts/show'

  devise_for :users
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

  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy], defaults: { format: 'js' }

  resources :users, :only => [:show]

  resources :posts, :categories

  resources :posts do
    put :favorite, on: :member
  end

  resources :favorites, :only => [:index]

  resources :posts do
    resources :comments, module: :posts
  end

  resources :comments

  get 'posts/:id/delete_image', to: 'posts#delete_image', as: 'delete_post_image'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  get 'welcome', to: 'pages#welcome' 

  root 'posts#index'
end
