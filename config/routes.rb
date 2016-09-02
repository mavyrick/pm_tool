Rails.application.routes.draw do

  get '/projects/favourites' => "projects#favourites"

  post '/projects' => "projects#create"

  delete '/projects/:id' => "projects#destroy"

  get '/projects/:id/edit' => "projects#edit", as: :edit_project

  get '/projects' => 'projects#index'

  get '/projects/new' => "projects#new"

  get '/projects/search' => "projects#search"

  get '/projects/search_button' => "projects#search_button"

  get '/projects/:id' => "projects#show", as: :project

  patch '/projects/:id' => "projects#update"

  get '/home/home' => "home#home", as: :home

  get '/home/about' => "home#about", as: :about

  root "home#home"

  get '/home/static'




  # get '/tasks/:id/edit' => "tasks#edit", as: :edit

  resources :projects do
    resources :discussions, only: [:create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :favourites, only: [:create, :destroy]
    resources :memberships, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
   delete :destroy, on: :collection
 end

  resources :tasks



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
