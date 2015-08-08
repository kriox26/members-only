Rails.application.routes.draw do
  get 	 'signup' => 'members#new'
  get 	 'login'  => 'session#new'
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
end
