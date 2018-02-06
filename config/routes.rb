Rails.application.routes.draw do
	
  root 'home#index'

  get 'articles', to: 'front_article#index'
  get 'articles/:id', to: 'front_article#show'

  get 'tags', to: 'front_tag#index'
  get 'tags/:id', to: 'front_tag#show'

  get 'admin', to: 'admin/admin#index'
  namespace :admin do
    resources :tags, :articles
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
