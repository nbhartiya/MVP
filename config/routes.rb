MVP::Application.routes.draw do
  
  resources :images

  resources :guests


  resources :tickets


  resources :comments


  resources :events


  resources :locations


  resources :accreditations


  #resources :authentications #, :only => [:show]
  #resources :investments
  #resources :projects
  #resources :user_answers
  #resources :survey_answers
  #resources :survey_questions

  get "home/index"
  get "home/about"
  get "home/blog"
  get "/done" => "signups#done"
  get "/wireframes" => redirect {"http://mainstproject.com/wireframes"}
  
  # didn't include registrations: "registrations", it seems to require a registrations controller...
  devise_for :users, controllers: {omniauth_callbacks: "authentications"}
  
  # I have no idea what changed that caused me to have to add this line...????
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  
  resources :users
  resources :signups
  
  get "survey" => "survey_questions#survey"
  get "incomplete_survey" => "survey_questions#survey"
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "signups#new"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
