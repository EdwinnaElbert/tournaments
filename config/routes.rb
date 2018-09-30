# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tournaments do
      resources :games
    end
    root to: "tournaments#new"
  end
  root "welcome#index"
end
