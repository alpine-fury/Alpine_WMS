# frozen_string_literal: true

Rails.application.routes.draw do
  mount Location::Engine => '/location'
end
