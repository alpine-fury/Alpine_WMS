# frozen_string_literal: true

module Inventory
  # Inventory mailer
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'mailer'
  end
end
