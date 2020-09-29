Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, skip: [:password, :confirm], controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
  }

  # devise_for :users, skip: [:password, :confirm]


 patch 'wastes/count_up' => 'wastes#count_up'
 patch 'wastes/count_down' => 'wastes#count_down'
 patch 'wants/purchase' => 'wants#purchase'

# resources :users, :except => :show do
resources :users, only:[:index, :update, :edit, :achievement, :mypage, :follows, :followers, :hide, :search] do
  get :search, on: :collection
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

resources :wastes, only:[:index, :create, :count_up, :count_down, :update, :hide, :reveal, :hide_away]
resources :wants, only:[:index, :show, :create, :purchase, :update, :destroy, :hide, :reveal] do
  resource :cheers, only:[:create, :destroy]
end


root 'homes#top'
get 'homes/about'
get 'mypage' => 'users#mypage'
get 'achievement' => 'users#achievement'


end
