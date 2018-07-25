Rails.application.routes.draw do
  mount Gatekeeper::Engine, at: '/auth'

  namespace :api do
    namespace :v1 do
      resources :labels, only: [:update]

      resources :snippets, except: [:show] do
        member do
          get 'raw', to: 'snippets#raw', as: 'raw_snippet'
        end
      end

      get 'data/default-state', to: 'data#default_state'
      get 'data/update-state', to: 'data#update_state'
    end
  end

  get 'help', to: 'pages#help'

  root 'repository#index'
end
