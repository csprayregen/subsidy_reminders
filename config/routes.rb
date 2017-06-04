Rails.application.routes.draw do
  root 'children#index'

  devise_for :providers



  # Routes for the Child resource:
  # CREATE
  get "/children/new", :controller => "children", :action => "new"
  post "/create_child", :controller => "children", :action => "create"

  # READ
  get "/children", :controller => "children", :action => "index"
  get "/children/:id", :controller => "children", :action => "show"

  # UPDATE
  get "/children/:id/edit", :controller => "children", :action => "edit"
  post "/update_child/:id", :controller => "children", :action => "update"

  # DELETE
  get "/delete_child/:id", :controller => "children", :action => "destroy"
  #------------------------------

  # Routes for the Guardian resource:
  # CREATE
  get "/guardians/new", :controller => "guardians", :action => "new"
  post "/create_guardian", :controller => "guardians", :action => "create"

  # READ
  get "/guardians", :controller => "guardians", :action => "index"
  get "/guardians/:id", :controller => "guardians", :action => "show"

  # UPDATE
  get "/guardians/:id/edit", :controller => "guardians", :action => "edit"
  post "/update_guardian/:id", :controller => "guardians", :action => "update"

  # DELETE
  get "/delete_guardian/:id", :controller => "guardians", :action => "destroy"
  #------------------------------

  # Routes for the Family resource:
  # CREATE
  get "/families/new", :controller => "families", :action => "new"
  post "/create_family", :controller => "families", :action => "create"

  # READ
  get "/families", :controller => "families", :action => "index"
  get "/families/:id", :controller => "families", :action => "show"

  # UPDATE
  get "/families/:id/edit", :controller => "families", :action => "edit"
  post "/update_family/:id", :controller => "families", :action => "update"

  # DELETE
  get "/delete_family/:id", :controller => "families", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
