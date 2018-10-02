# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tournaments do
      resources :matches
    end
    resources :scores, only: :create
    root to: "tournaments#new"
  end
  root "welcome#index"
end
