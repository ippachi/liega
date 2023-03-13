# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  match "auth/:provider/callback", to: "sessions#create", via: %i[get post]

  resource :registrations, only: %i[new create]
  resources :projects, only: %i[index show create]

  put "starred_projects", to: "starred_projects#update"
  delete "starred_projects", to: "starred_projects#destroy"
end
