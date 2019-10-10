# frozen_string_literal: true

module Location
  # abstract
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
