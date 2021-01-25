Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'user_signup', to: 'devise/registrations#new'
    get 'user_signin', to: 'devise/sessions#new'
    get 'user_logout', to: 'devise/sessions#destroy'
  end

  authenticated :user do
    root to: 'page#home', as: 'authenticated_route'
  end
  root to: 'page#see'
end
