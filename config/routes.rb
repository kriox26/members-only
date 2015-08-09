Rails.application.routes.draw do
  root 				 'stories#index'
  get 	 'signup' => 'members#new'
  get 	 'login'  => 'session#new'
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  resources :stories
end
