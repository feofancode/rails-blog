Rails.application.routes.draw do

  get 'admin', to: 'admin/admin#index'
  namespace :admin do
    resources :articles
  end

  get 'articles', to: 'static_article#index'
  get 'articles/:id', to: 'static_article#show'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
