KineApp::Application.routes.draw do

  resources :rdvs

  get "medecins/new"

  get "medecins/show"

  get "medecins/edit"

  get "medecins/index"

  get "ordonnances/new"

  get "ordonnances/show"

  get "ordonnances/index"

  get "ordonnances/edit"

  get "seances/new"

  get "seances/show"

  #On ajoute les ressources (les tables accessibles)
  
  # Edit d'audric :
  # en fait, faire resources :toto va créer automatiquement 7 routes :
  #
  # Verb   | Path           | action   | used for
  # -------------------------------------------------------------------------------
  # GET    | /toto          | index    | display a list of all totos
  # GET    | /toto/new      | new      | return an HTML form for creating a new toto
  # POST   | /toto          | create   | create a new toto
  # GET    | /toto/:id      | show     | display a specific toto
  # GET    | /toto/:id/edit | edit     | return an HTML form for editing a toto
  # PUT    | /toto/:id      | update   | update a specific toto
  # DELETE | /toto/:id      | destroy  | delete a specific toto
  #
  
 resources :patients do
  get :autocomplete_ville_nom, :on => :collection
end

  resources :patients
  resources :users  
  resources :seances
  resources :sessions, :only => [:new, :create, :destroy]
  resources :ordonnances
   resources :medecins  
  #This has to be solve this is not correct
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  root :to => 'pages#home'
  
 # get "users/new"
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  get "patient/create"
  get "patient/update"  
  
  get "users/search"
  
  # FIXME: pierre Pour les moteurs de recherche (on pourra surment faire mieux vu qu'on renvoi sur l'index)
  match 'search_user' , :to => 'users#index'
  match 'search_ordonnance', :to => 'ordonnances#index'

  #match 'root_path' => redirect('/pages/home')
  #match 'about_path' => redirect('/pages/home')
  #match 'contact_path' => redirect('/pages/home')
  #  match 'help_path' => redirect('/pages/home')
  #  match 'signup_path' => redirect('/pages/home')
  #  match 'signin_path' => redirect('/pages/home')

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
  #      :comments, :sales
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
