Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # routes
  root "api/v1/patients#new"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :patients
    end
  end
end
