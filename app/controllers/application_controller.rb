class ApplicationController < ActionController::Base

  before_action :authenticate_provider!


  protect_from_forgery with: :exception
end
