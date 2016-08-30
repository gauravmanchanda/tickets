Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :tickets do
    member do
      patch :next_event
      patch :assign
    end
    collection do
      get :resolved_report
    end
  end
  resources :users
  post '/comments', to: 'comments#create', as: 'comments'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
