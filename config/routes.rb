Rails.application.routes.draw do
  resources :artists do
    resources :songs
  end

  resources :songs
  resources :playlists
  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
