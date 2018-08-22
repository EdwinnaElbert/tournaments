# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    resources :my_surveys # созданные юзером
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :app do
    resources :surveys, except: :show do
      get :export_excel, on: :collection
    end
  end
  root to: "welcome#show"
end
