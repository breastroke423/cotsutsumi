Rails.application.routes.draw do
  devise_for :users

resources :users, only:[:index, :show, :update, :edit]
resources :wants, only:[:index, :edit, :update, :new, :create, :destroy]
resources :wastes, only:[:index, :show, :edit, :new, :create, :destroy]
resources :wants do
  resource :cheers, only:[:create, :destoroy]
end



root 'homes#top'
get 'homes/about'

end
