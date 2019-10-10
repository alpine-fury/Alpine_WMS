# frozen_string_literal: true

module Inventory
  # Inventory controller
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
  end
end
