Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, shallow: true
    # resources :doses, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
