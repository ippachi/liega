# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  post "auth/:provider/callback", to: "sessions#create"

  resources :projects, only: %i[index]
end
