Rails.application.routes.draw do
devise_for :users

patch 'wastes/count_up' => 'wastes#count_up'
patch 'wastes/count_down' => 'wastes#count_down'
patch 'wants/purchase' => 'wants#purchase'

resources :users do
  resource :relationships, only: [:create, :destroy]
  get :follows
  get :followers
end

  put 'users/:id/hide' => 'users#hide', as:'users_hide'
  put 'wastes/:id/hide' => 'wastes#hide', as:'wastes_hide'
  put 'wastes/:id/reveal' => 'wastes#reveal', as:'wastes_reveal'
  put 'wastes/:id/hide_away' => 'wastes#hide_away', as:'wastes_hide_away'
  put 'wants/:id/hide' => 'wants#hide', as:'wants_hide'
  put 'wants/:id/reveal' => 'wants#reveal', as:'wants_reveal'

resources :wastes
resources :wants do
  resource :cheers, only:[:create, :destroy]
end


root 'homes#top'
get 'homes/about'
get 'mypage' => 'users#mypage'
get 'achievement' => 'users#achievement'


end
