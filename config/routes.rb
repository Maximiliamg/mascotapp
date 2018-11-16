Rails.application.routes.draw do

  #resources from user
  resources :users, only: [:index, :show, :create, :update, :destroy]
  get 'user_seller_score/:id', to: 'users#seller_score'
  get 'user_buyer_score/:id', to: 'users#buyer_score'
  get 'pending_actions', to: 'users#pending_actions'

  #resources from session
  resources :sessions, only: :create
  delete 'sessions', to: 'sessions#destroy'

  #routes for admins
  namespace :users do
    put ':user_id/block' , to: 'admins#block'
    put ':user_id/unblock', to: 'admins#unblock'
    get 'blocks/admin', to: 'admins#index_block'
  end

  namespace :products do
    put ':product_id/block', to: 'admins#block'
    put ':product_id/unblock', to: 'admins#unblock'
    get 'blocks/admin', to: 'admins#index_block'
  end

  #routes for products
  resources :products, only: [:index, :show, :create, :update, :destroy] do
    #routes for commments
    resources :commments, only: [:index, :create]
    #route for setting destination
    put 'set_purchase_destination/:origin_id', to: 'purchases#set_destination'
    #route for pictures
    put 'upload_pictures', to: 'pictures#product'
    delete 'product_picture/:product_picture_id', to: 'pictures#destroy'
    resources :pictures, only: [:index]
  end

  #routes for origins
  resources :origins, only: [:index, :show, :create, :update, :destroy]

  #route for search
  post 'search', to: 'products#search'

  #routes for commments
  resources :commments, only: [:show, :destroy]
  get 'user_commments', to: 'commments#index_user'

  #routes for purchases
  resources :purchases, only: [:index, :show, :create]
  get 'user_sales', to: 'purchases#sold_index'
  put 'buyer_score/:id', to: 'purchases#set_buyer_score'
  put 'seller_score/:id', to: 'purchases#set_seller_score'
  put 'purchase_shipped/:id', to: 'purchases#set_was_shipped'
  put 'purchase_delivered/:id', to: 'purchases#set_was_delivered'
  #route for profile pictures
  put 'profile_pictures', to: 'pictures#profile'
  put 'product_picture/:product_picture_id/set_cover', to: 'pictures#set_picture_as_cover'

end