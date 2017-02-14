Rails.application.routes.draw do

  get '/beers' => 'beers#index'
  get '/beers/new' => 'beers#new'
  post '/beers' => 'beers#create'
  get '/beers/:id' => 'beers#show'
  get '/beers/:id/edit' => 'beers#edit'
  patch '/beers/:id' => 'beers#update'
  delete '/beers/:id' => 'beers#destroy'

end
