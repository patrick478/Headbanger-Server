Rails.application.routes.draw do
 
  resources :song_listens

  resources :songs

  resources :users

  root 'welcome#index'

end
