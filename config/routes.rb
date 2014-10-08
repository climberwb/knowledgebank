Rails.application.routes.draw do
  
  get 'user_plans/update_plan'

  resources :wikis do 
    # member do
    #   get 'collaboration'
    # end

    resources :collaborations
  end
  get "/collaborations" => "collaborations#collaboration_search", as: 'collaboration_search'

  #get "/controllers/collaborations_controller" => 'collaborations#search_collaboration', as: 'search_collaboration_collaborations_controller'
#get 'wiki/collaboration/:id'
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/about'

  root to: 'welcome#index'
  resources :users do
 resources :wikis
end

end

