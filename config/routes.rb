SmileTeam::Application.routes.draw do
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  root :to => "home#index"

  resources :events do
    member do
      get "invite_all"
    end
  end

  # resource :users
  match "/users" => "users#index",          via: :get,    as: :users
  match "/users" => "users#create",         via: :post,   as: :users
  match "/users/new" => "users#new",        via: :get,    as: :new_user
  match "/users/:id/edit" => "users#edit",  via: :get,    as: :edit_user
  match "/users/:id" => "users#show",       via: :get,    as: :user
  match "/users/:id" => "users#update",     via: :put,    as: :user
  match "/users/:id" => "users#destroy",    via: :delete, as: :user
  match "/users/:id/approve_join_request" => "users#approve_join_request",  via: :get, as: :approve_join_request
  match "/users/:id/reject_join_request" => "users#reject_join_request",    via: :get, as: :reject_join_request

  match "/team" => "groups#join_requests",           as: :join_requests
  match "/team/approve_all" => "groups#approve_all", as: :approve_all
  match "/team/reject_all" => "groups#reject_all",   as: :reject_all

  resource :invites, only: [:update]


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
  # match ':controller(/:action(/:id(.:format)))'
end
