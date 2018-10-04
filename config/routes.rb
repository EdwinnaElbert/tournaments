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

    if Tournament.where(active: true).any?
      root to: "tournaments#show", id: Tournament.where(active: true).order(created_at: :desc).first.id
    else
      root to: "tournaments#new"
    end

  end
  root "welcome#index"
end
