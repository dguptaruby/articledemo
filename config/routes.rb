Rails.application.routes.draw do
	
  resources :displays
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "admin/dashboard#index"
  ActiveAdmin.routes(self)
  get 'show_snippet' => 'display#show_snippet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end