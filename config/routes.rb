# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # engines
  mount Inventory::Engine => '/inventory'
  mount Location::Engine => '/location'
end
