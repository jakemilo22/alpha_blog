module ApplicationHelper

  def current_user
    # if @current_user has not been triggered yet, then execute if statement by using '||='
    @current_user ||=  User.find(session[:user_id]) if session[:user_id] 
  end

  def logged_in?
    # !!current_user returns boolean
    !!current_user
  end
end
