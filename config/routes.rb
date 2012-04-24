Filebook::Application.routes.draw do
  match 'topics/index', :to => 'topics#index' , :as => :topics

  get "topics/index"

  get "topics/show"

  match "topics/comment/:id", :to => 'topics#comment', :as => :topic_comment

  get "topics/like"

  get "home/index"

  get "users/find", :to => 'users#find', :as => :users_find
  get "users/following", :to => 'users#following', :as => :users_following
  get "users/followers", :to => 'users#followers', :as => :users_followers


  match 'fichiers/tab', :to => 'fichiers#tab', :as => :tab_fichiers
  resources :fichiers

  match 'fichiers/trash/:id', :to => 'fichiers#trash' , :as => :trash_fichier
  match 'fichiers/restore/:id', :to => 'fichiers#restore', :as => :restore_fichier
  match 'fichiers/download/:id', :to => 'fichiers#download', :as => :download_fichier
  match 'fichiers/favori/:id', :to =>   'fichiers#favori', :as => :favori_fichier
  match 'fichiers/share/:id', :to => 'fichiers#share', :as => :share_fichier
  match 'fihciers/sharing/:id', :to => 'fichiers#sharing', :as => :sharing_fichier

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions

  root :to => "home#index"

  match 'users/follow/:id', :to => 'users#follow', :as => :follow_user
  match 'users/unfollow/:id', :to => 'users#unfollow', :as => :unfollow_user 
 
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
