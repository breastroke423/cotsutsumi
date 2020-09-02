Rails.application.routes.draw do
  devise_for :users

resources :users, only:[:index, :show, :update, :edit, :mypage]
resources :wastes, only:[:index, :show, :edit, :new, :create, :destroy]
resources :wants, only:[:index, :edit, :update, :new, :create, :destroy] do
  resource :cheers, only:[:create, :destoroy]
end


root 'homes#top'
get 'homes/about'
get 'mypage' => 'users#mypage'
end
