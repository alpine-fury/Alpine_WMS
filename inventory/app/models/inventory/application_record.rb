# frozen_string_literal: true

module Inventory
  # Inventory application records
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
