Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :recurrings, except: :show do
      resources :plans, except: :show
    end

    resources :subscriptions, only: :index
    resources :subscription_events, only: :index
  end

  resources :recurring_hooks, only: :none do
    post :handler, on: :collection
  end

  
  resources :plans, only: :index do
    resources :subscriptions, only: [:show, :create, :destroy, :new] 
  end

  match 'confirmation', to: 'subscriptions#confirmation', via: :get


  match 'cancellation', to: 'subscriptions#cancellation', via: :get

  get :send_postponement_mail, to: 'subscriptions#postponement', as: :send_postponement_mail 

end
