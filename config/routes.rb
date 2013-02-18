GistClone::Application.routes.draw do
  resource :sessions
  resources :users
  resources :gists

  root to: 'gists#index'
end
