Rails.application.routes.draw do
  #Comments routes
  get '/comments' => 'comment#index'
  post '/restaurant/:restaurant_id/comment' => 'comment#create'


  #Restaurants routes
  get '/restaurants' => 'restaurant#index'
  get '/restaurant/:id' => 'restaurant#show'
  post '/restaurant' => 'restaurant#create'

end
