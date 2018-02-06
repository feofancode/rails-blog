Rails.application.routes.draw do

  get 'static_tag/index'

  get 'static_tag/show'

  namespace :admin do
    resources :tags
  end
  get 'admin', to: 'admin/admin#index'
  namespace :admin do
    resources :articles
  end

  get 'articles', to: 'static_article#index'
  get 'articles/:id', to: 'static_article#show'
  get 'tags', to: 'static_tag#index'
  get 'tags/:id', to: 'static_tag#show'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
