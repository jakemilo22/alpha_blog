class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # code below makes current_user available to views as well not just controllers!!
  helper_method :current_user
  helper_method :logged_in?

  # code extracted from application_helper.rb from app/helpers folder
  def current_user
    # if @current_user has not been triggered yet, then execute if statement by using '||='
    @current_user ||=  User.find(session[:user_id]) if session[:user_id] 
  end  

  # code extracted from application_helper.rb from app/helpers folder
  def logged_in?
    # !!current_user returns boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end 
  end 

end
