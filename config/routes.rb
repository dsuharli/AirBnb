Air::Application.routes.draw do
  resources :users 
  resources :message_threads, only: [:index, :show]
  resources :messages
  resource :session, only: [:create, :destroy, :new]
  resources :places do
    resources :place_rental_requests, except: [:edit, :update] do
      member do
        get "approve", "deny"
      end
    end
  end

  root to: "homes#show"

end