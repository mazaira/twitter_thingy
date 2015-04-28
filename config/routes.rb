Rails.application.routes.draw do
  devise_for :users

  root 'shared#index'

  resources :tweets do
    resources :comments
  end
  
  resources :users do
    member do 
      get :following, :followers
    end
  end

  resources :shared 

end
