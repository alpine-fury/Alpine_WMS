# frozen_string_literal: true

module Location
  # mailer default
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'mailer'
  end
end
