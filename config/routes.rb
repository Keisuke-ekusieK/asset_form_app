Rails.application.routes.draw do
  get 'families/new'
  get 'families/edit'
  get 'families/show'
  get 'sessions/new'
	get  '/signup',  to: 'users#new'
	root   'static_pages#home'
  get    '/home',             to: 'static_pages#home'
	get    '/login',            to: 'sessions#new'
	post   '/login',            to: 'sessions#create'
	delete '/logout',           to: 'sessions#destroy'
	resources :users
end
