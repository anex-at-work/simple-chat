Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :update] do
    collection do
      patch 'jquery_interval', action: 'scenario_jquery_interval'
    end
  end
  resources :messages, only: :index

  root to: 'messages#index'
end
