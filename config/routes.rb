Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root 'leave_requests#index'

  resources :leave_requests, only: [:show, :index, :new] do
    collection do
      post :submit, to: 'leave_requests#submit'
    end
    member do
      post :change_duration
    end
  end
end
