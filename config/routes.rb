GistClone::Application.routes.draw do
  resource :session, :only => [:create, :destroy, :new]
  resources :users
  resources :favorites, :only => [:index]

  resources :gists do
    resource :favorite, :only => [:create, :destroy]
  end

  root to: 'gists#index'
end
