Rails.application.routes.draw do
  get 'sessions/new'
	get  '/signup',  to: 'users#new'
	root   'static_pages#home'
  get    '/home',             to: 'static_pages#home'
	get    '/login',            to: 'sessions#new'
	post   '/login',            to: 'sessions#create'
	delete '/logout',           to: 'sessions#destroy'
	resources :users do
    member do
      get :following, :followers
    end
  end
	resource  :family,           only: [:new, :create, :edit, :update, :show]
	resource  :asset_allocation, only: [:new, :create, :edit, :update, :show]
	resources :monthly_expenses, only: [:create, :destroy]
	resources :relationships,    only: [:create, :destroy]
	resources :likes, only: [:create, :destroy]
end
