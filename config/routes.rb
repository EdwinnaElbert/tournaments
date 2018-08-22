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
  authenticated :user do
   root :to => "my_surveys#index"
   # Rails 4 users must specify the 'as' option to give it a unique name
   # root :to => "main#dashboard", :as => "authenticated_root"
 end
end
