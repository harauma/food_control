class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_current_user
  def set_current_user
    @current_user = User.find_by(id: session[:userid])
  end
end
