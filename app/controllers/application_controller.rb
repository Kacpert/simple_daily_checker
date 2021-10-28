class ApplicationController < ActionController::Base
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'kacper' && password == 'Qwerty1@'
    end
  end
end
