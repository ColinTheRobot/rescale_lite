Rails.application.routes.draw do
  resources :users do
    resources :question_answers, only: [:new, :create, :update, :show]
  end
  resources :ingredients
  resources :recipes

  post "/set_current_user", to: "application#set_current_user"
  root "recipes#index"
end
