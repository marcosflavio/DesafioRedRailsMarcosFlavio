Rails.application.routes.draw do
  
  
  devise_for :users
  
  # Aqui são definidas todas as rotas para as Páginas contidas em view/pages
  
  #Rota para a action index no controller/pages_controller
  get '/index' =>  'pages#index'
  
  #Rota para a action home no controller/pages_controller
  get '/home'  =>  'pages#home'

  #Rota para a action profile no controller/pages_controller
  get '/user/:id' =>  'pages#profile'
  
  #Rota para a action explore no controller/pages_controller
  get '/moments' =>  'pages#moments'
  
  #Declarando a página principal da aplicação
  root 'pages#index'
  
  
  #Desclaracao para utilizar 
  resources :redweets
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
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
