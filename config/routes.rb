Rails.application.routes.draw do
  devise_for :users

resources :users
resources :wastes
resources :wants do
  resource :cheers, only:[:create, :destoroy]
end


root 'homes#top'
get 'homes/about'
get 'mypage' => 'users#mypage'
patch 'wastes/count_up' => 'wastes#count_up'
patch 'wastes/count_down' => 'wastes#count_down'
end
