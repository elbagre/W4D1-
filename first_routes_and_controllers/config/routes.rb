Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :update, :show]

  resources :contacts, only: [:create, :destroy, :update, :show]

  resources :contact_shares, only: [:create, :destroy]

  get 'users/:id/contacts' => 'contacts#index'
end
