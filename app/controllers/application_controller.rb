class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info, :error, :notice
  #ties to app/helpers/application_helper.rb
end
