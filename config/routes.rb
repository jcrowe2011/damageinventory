Dmginv::Application.routes.draw do
  root :to => "dashboard#index"
  
  devise_for :users

  resources :products
  

  resources :stores do
	  resources :products
	end

  resources :users
  

end
