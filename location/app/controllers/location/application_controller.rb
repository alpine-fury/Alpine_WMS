# frozen_string_literal: true

module Location
  # Location controller
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
  end
end
