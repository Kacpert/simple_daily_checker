Rails.application.routes.draw do
  root to: 'epicks#index'

  resources :epicks do
    post :update_status, on: :member
  end
end
