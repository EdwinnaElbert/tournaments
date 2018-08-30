# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    # созданные юзером
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace :app do
  #   resources :surveys, except: [:create, :new, :destroy, :edit, :update] do
  #     get :export_excel, on: :collection
  #   end
  # end

  authenticated :user do
    resources :my_surveys
    root to: "my_surveys#index"
  end
  resources :surveys do
    # resources :users, only: :show
    member do
      get :show_answers
      get :answer
      post :answer_survey
    end
  end
  root "my_surveys#index"
end
