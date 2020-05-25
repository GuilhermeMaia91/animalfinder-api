Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post '/login' => 'sessions#login'
      post '/signup' => 'sessions#signup'
      get '/animals' => 'sessions#listAnimals'
      get '/lost-animals' => 'sessions#listLostAnimals'
      post '/found' => 'sessions#found'

      get 'owner/show' => 'owner#show'
      put 'owner/edit' => 'owner#edit'

      get 'animal/list' => 'animal#list'
      get 'animal/comunicated/:id' => 'animal#foundList'
      get 'animal/show/:id' => 'animal#show'
      post 'animal/insert' => 'animal#insert'
      put 'animal/edit' => 'animal#edit'
      delete 'animal/delete/:id' => 'animal#delete'
    end
  end
end