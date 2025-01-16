Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: [:index]
  
  resources :product, only: [:index, :show]do
    post 'add_to_cart', on: :member
  end

  resources :carts, only: [:show] do
    member do
      delete :remove_from_cart
    end
  end

  resources :orders, only: [:index, :show] do
    resources :payments, only: [:new, :create]
    member do
      post :checkout
    end
  end

  resources :blogs, only: [:index, :show]

  root "home#index"
  
  get "about" => "home#about"
  get "service" => "home#service"
  get "contact" => "home#contact"
  get "testimonial" => "home#testimonial"
  get "feature" => "home#feature"

  post 'generate', to: 'generative#generate'
end
