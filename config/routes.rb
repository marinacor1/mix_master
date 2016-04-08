Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new]
  end
end
