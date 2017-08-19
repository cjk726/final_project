Rails.application.routes.draw do
  
  root "outfits#index"

  devise_for :users
  
  # Routes for the Street to Weather resources:
  
  get("/street_to_weather/new", { :controller => "meteorologist", :action => "street_to_weather_form" })
  get("/street_to_weather", { :controller => "meteorologist", :action => "street_to_weather" })

  # Routes for the Users resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"
  
  # Routes for the Comfort_zone resource:
  # CREATE
  get "/comfort_zones/new", :controller => "comfort_zones", :action => "new"
  post "/create_comfort_zone", :controller => "comfort_zones", :action => "create"

  # READ
  get "/comfort_zones", :controller => "comfort_zones", :action => "index"
  get "/comfort_zones/:id", :controller => "comfort_zones", :action => "show"

  # UPDATE
  get "/comfort_zones/:id/edit", :controller => "comfort_zones", :action => "edit"
  post "/update_comfort_zone/:id", :controller => "comfort_zones", :action => "update"

  # DELETE
  get "/delete_comfort_zone/:id", :controller => "comfort_zones", :action => "destroy"
  #------------------------------

  # Routes for the Clothing_item resource:
  # CREATE
  get "/clothing_items/new", :controller => "clothing_items", :action => "new"
  post "/create_clothing_item", :controller => "clothing_items", :action => "create"

  # READ
  get "/clothing_items", :controller => "clothing_items", :action => "index"
  get "/clothing_items/:id", :controller => "clothing_items", :action => "show"

  # UPDATE
  get "/clothing_items/:id/edit", :controller => "clothing_items", :action => "edit"
  post "/update_clothing_item/:id", :controller => "clothing_items", :action => "update"

  # DELETE
  get "/delete_clothing_item/:id", :controller => "clothing_items", :action => "destroy"
  #------------------------------

  # Routes for the Outfit_item resource:
  # CREATE
  get "/outfit_items/new", :controller => "outfit_items", :action => "new"
  post "/create_outfit_item", :controller => "outfit_items", :action => "create"

  # READ
  get "/outfit_items", :controller => "outfit_items", :action => "index"
  get "/outfit_items/:id", :controller => "outfit_items", :action => "show"

  # UPDATE
  get "/outfit_items/:id/edit", :controller => "outfit_items", :action => "edit"
  post "/update_outfit_item/:id", :controller => "outfit_items", :action => "update"

  # DELETE
  get "/delete_outfit_item/:id", :controller => "outfit_items", :action => "destroy"
  #------------------------------

  # Routes for the Outfit resource:
  # CREATE
  get "/outfits/new", :controller => "outfits", :action => "new"
  post "/create_outfit", :controller => "outfits", :action => "create"

  # READ
  get "/outfits", :controller => "outfits", :action => "index"
  get "/outfits/:id", :controller => "outfits", :action => "show"

  # UPDATE
  get "/outfits/:id/edit", :controller => "outfits", :action => "edit"
  post "/update_outfit/:id", :controller => "outfits", :action => "update"

  # DELETE
  get "/delete_outfit/:id", :controller => "outfits", :action => "destroy"
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
