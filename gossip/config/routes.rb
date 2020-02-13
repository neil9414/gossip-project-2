Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users
  resources :events do
  	resources :attendances, except: [:new, :show, :edit] do
  		resources :charges
  	end
  end
end
