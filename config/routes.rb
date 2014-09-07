Rails.application.routes.draw do

  resources :wikis do 
    # member do
    #   get 'collaboration'
    # end

    resources :collaborations
  end
  
#get 'wiki/collaboration/:id'
  devise_for :users
  get 'welcome/about'

  root to: 'welcome#index'
end

