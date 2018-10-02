# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tournaments do
      resources :matches
    end
    resources :scores do
      post "generate_random", to: "scores#generate_random", on: :collection
    end
    root to: "tournaments#new"
  end
  root "welcome#index"
end
