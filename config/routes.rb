Rails.application.routes.draw do
  get '/' => 'users#index'
  get '/events' => 'events#index'
  post '/users/new' => 'users#create'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  get '/show/:id' => 'users#show'
  patch '/update' => 'users#update'
  get '/events/:id' => 'events#profile'
  post '/ecreate' => 'events#ecreate'
  post '/comment/:id' => 'comments#create'
  post '/join/:id' => 'events#join'
  delete '/leave/:id' => 'events#leave'
  delete '/delete/:id' => 'events#destroy'
  get '/eupdate/:id' => 'events#edit'
  patch '/eupdate/:id' => 'events#eupdate'

end
