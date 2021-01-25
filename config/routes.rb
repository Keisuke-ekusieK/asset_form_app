Rails.application.routes.draw do
	get  '/signup',  to: 'users#new'
	root   'static_pages#home'
  get    '/home',             to: 'static_pages#home'
end
