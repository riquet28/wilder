Rails.application.routes.draw do
  
  root 'posts#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts

  get 'user/index'
  
  resources :offres
  
  resources :challenges do
    resources :participations
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

end
