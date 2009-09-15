ActionController::Routing::Routes.draw do |map|
  map.connect 'mps', :controller => 'member', :action => 'representatives'
  map.connect 'senators', :controller => 'member', :action => 'senators'
  # TODO: Hardcoding house numbers below. Very nasty.
  map.connect 'mp/:name/:constituency', :controller => 'member', :action => 'show', :house => 1
  map.connect 'mp', :controller => 'member', :action => 'show', :house => 1
  map.connect 'senator/:name/:constituency', :controller => 'member', :action => 'show', :house => 2
  map.connect 'debates', :controller => 'debate', :action => 'debate'
  map.connect 'debate', :controller => 'debate', :action => 'speech'
  map.connect 'hansard', :controller => 'debate', :action => 'hansard'
  map.connect 'news', :controller => 'news', :action => 'index'
  map.connect 'news/archives/:year/:month/:day/:title', :controller => 'news', :action => 'show'
  map.connect 'news/archives/:year/:month', :controller => 'news', :action => 'index'
  map.connect 'comments/recent', :controller => 'comments', :action => 'recent'

  # For rendering the static content pages
  map.connect 'help', :controller => 'static', :action => 'help'
  map.connect 'about', :controller => 'static', :action => 'about'
  map.connect 'contact', :controller => 'static', :action => 'contact'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
