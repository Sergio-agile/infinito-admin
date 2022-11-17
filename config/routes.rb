Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :patients, only: [:index, :show, :new, :create, :edit, :update] do
    resources :consultations, only: [:new, :create, :edit, :update]
  end

  resources :sections, only: [:index, :new, :create, :show, :edit, :update] do
    resources :questions, only: [:new, :create, :edit, :update, :show]
  end
end
