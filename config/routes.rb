Rails.application.routes.draw do
  namespace :v1 do
    get  '/lists/:name' => 'lists#show'
    get '/lists' => 'lists#index'
    post '/lists' => 'lists#create'
    post '/lists/:list_name/items' => 'tasks#create'
  end
  

end
