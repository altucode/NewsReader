NewReader::Application.routes.draw do
  namespace :api do
    resources :feeds, only: [:index, :create, :show] do
      resources :entries, only: [:index] do
        resources :fav_entries, only: [:index]
      end

      resources :fav_feeds, only: [:index]
      resources :subscriptions, only: [:index]
    end

    resources :users, only: [:index, :create, :show] do
      resources :fav_entries, only: [:index]
      resources :fav_feeds, only: [:index]
      resources :subscriptions, only: [:index]
    end
    resources :fav_feeds, only: [:destroy]
    resources :fav_entries, only: [:destroy]
  end

  resource :session, only: [:create, :destroy]

  root to: "static_pages#index"
end
