Eappscasts::Application.routes.draw do
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
  
    root :to => "info#home"

    match "auth/:provider/callback" => "sessions#create"
    match "/auth/failure", :to => "sessions#failure"
    match "twitter_login" => "sessions#twitter_login" ,:as=>"twitter_login"
    match "twitter_login_check" => "sessions#twitter_login_check" ,:as=>"twitter_login_check"
    match "/signout" => "sessions#destroy", :as => :signout
    match "about" => "info#about", :as => "about"
    match "login" => "info#login", :as => "login"
    match "opensource" => "info#opensource", :as => "opensource"
    match "give_back" => "info#give_back", :as => "give_back"
    match "contributors" => "info#contributors", :as => "contributors"
    #match "login" => "users#login", :as => "login"
    match "logout" => "users#logout", :as => "logout"
    match "feedback" => "feedback_messages#new", :as => "feedback"
    match "episodes/archive" => redirect("/?view=list")
    match 'unsubscribe/:token' => 'users#unsubscribe', :as => "unsubscribe"
    post "versions/:id/revert" => "versions#revert", :as => "revert_version"
    get '/signup' => 'info#signup', :as => :signup  
  
    resources :users do
      member { put :ban }
    end
    resources :comments
    resources :episodes
    resources :feedback_messages

    match "tags/:id" => redirect("/?tag_id=%{id}")
  
end
