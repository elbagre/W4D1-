Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :update, :show]
end
