GistClone::Application.routes.draw do
  resource :sessions
  resources :users

  root to: 'gists#index'
end
