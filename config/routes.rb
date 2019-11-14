Rails.application.routes.draw do
  get 'user/index'
  get 'user/new' => 'user#new'
  get 'user/mente' => 'user#mente'
  post 'user/new' => 'user#create'
  post 'user/choice' => 'user#choice'
  post 'user/delete' => 'user#destroy'


  get 'ingredient/new'
  post 'ingredient/new' => 'ingredient#create'
  post 'ingredient/delete' => 'ingredient#destroy'

  get '/' => 'food#index'
  get 'food/index'
  get 'food/new' => 'food#new'
  post 'food/new' => 'food#create'
  post 'food/delete' => 'food#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
