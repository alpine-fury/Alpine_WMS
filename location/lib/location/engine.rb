# frozen_string_literal: true

module Location
  # Location namespace creation
  class Engine < ::Rails::Engine
    isolate_namespace Location
  end
end
