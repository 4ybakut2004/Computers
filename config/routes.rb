Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Домашнаяя страница
  root 'static_pages#index'

  # Пути к статическим страничкам
  get 'static_pages/home'
  get 'static_pages/success_dialog'
  get 'static_pages/error_dialog'

  namespace :api do
    namespace :v1 do
      # Отправка заявки
      resources :requests, only: [:create]
    end
  end

  # По всем путям выдавать домашнюю страницу, так как роутингом управляет angularjs
  get "*path" => "static_pages#index"
end