Rails.application.routes.draw do
  # get 'cocktail/ingredient'
  # get 'cocktail/dose'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :cocktails
  # resources :ingredients
  # resources :doses
  resources :cocktails do
    resources :doses
  end

  root to: "cocktails#index"
end
