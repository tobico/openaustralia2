ActionController::Routing::Routes.draw do |map|
  # TODO: Hardcoding house numbers below. Very nasty.

  # Would like to use :defaults => {:o => "l"} in the route below, but this appears to be currently broken.
  # See https://rails.lighthouseapp.com/projects/8994/tickets/2478-defaults-not-in-path-cause-no-matching-segment-exists-error
  map.representatives 'mps', :controller => 'member', :action => 'index', :house => 1, :trailing_slash => true
  map.senators 'senators', :controller => 'member', :action => 'index', :house => 2, :trailing_slash => true
  map.representative 'mp', :controller => 'member', :action => 'show', :house => 1, :trailing_slash => true
  map.senator 'senator', :controller => 'member', :action => 'show', :house => 2, :trailing_slash => true
  map.representative_name 'mp/:name/:constituency', :controller => 'member', :action => 'show', :house => 1
  map.senator_name 'senator/:name/:constituency', :controller => 'member', :action => 'show', :house => 2
  
  map.representatives_debate 'debates', :controller => 'debate', :action => 'representative_debate', :trailing_slash => true
  map.senate_debate 'senate', :controller => 'debate', :action => 'senate_debate', :trailing_slash => true
  map.representative_speech 'debate', :controller => 'debate', :action => 'speech', :trailing_slash => true
  map.hansard 'hansard', :controller => 'debate', :action => 'hansard', :trailing_slash => true
  
  map.posts 'news', :controller => 'news', :action => 'index', :trailing_slash => true
  map.post 'news/archives/:year/:month/:day/:title', :controller => 'news', :action => 'show'
  map.posts_in_month 'news/archives/:year/:month', :controller => 'news', :action => 'index'
  # This url does the same as 'news'. Dumb, I know.
  map.posts_archives 'news/archives', :controller => 'news', :action => 'index', :trailing_slash => true
  map.posts_rss 'news/index.rdf', :controller => 'news'

  map.recent_comments 'comments/recent', :controller => 'comments', :action => 'recent', :trailing_slash => true
  
  map.user 'user', :controller => 'user', :action => 'show'
  map.login 'user/login', :controller => 'user', :action => 'login'
  map.logout 'user/logout', :controller => 'user', :action => 'logout'
  map.join 'user/join', :controller => 'user', :action => 'new'
  map.password 'user/password', :controller => 'user', :action => 'password'
  map.resources :user
  
  map.report 'report', :controller => 'comments', :action => 'report', :trailing_slash => true
  map.api 'api', :controller => 'api', :trailing_slash => true
  map.add_comment 'user/prompt', :controller => 'comment', :action => 'new', :trailing_slash => true, :anchor => "addcomment"
  map.alert 'alert', :controller => 'alert', :trailing_slash => true
  map.search 'search', :controller => 'search', :trailing_slash => true

  # For rendering the static content pages
  map.help 'help', :controller => 'static', :action => 'help', :trailing_slash => true
  map.about 'about', :controller => 'static', :action => 'about', :trailing_slash => true
  map.contact 'contact', :controller => 'static', :action => 'contact', :trailing_slash => true
  map.link_to_us 'help/linktous', :controller => 'static', :action => 'link_to_us', :trailing_slash => true
  map.house_rules 'houserules', :controller => 'static', :action => 'house_rules', :trailing_slash => true
  
  map.root :controller => "home"
  
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
