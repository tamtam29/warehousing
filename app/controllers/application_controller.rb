class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end
end
