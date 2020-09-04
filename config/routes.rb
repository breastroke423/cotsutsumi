Rails.application.routes.draw do
  devise_for :users

patch 'wastes/count_up' => 'wastes#count_up'
patch 'wastes/count_down' => 'wastes#count_down'
patch 'users/purchase' => 'users#purchase'

resources :users
resources :wastes
resources :wants do
  resource :cheers, only:[:create, :destoroy]
end


root 'homes#top'
get 'homes/about'
get 'mypage' => 'users#mypage'
get 'achievement' => 'users#achievement'

end
