class PagesController < ApplicationController
  
  # this will call home.html.erb found under views/pages folder
  def home
    redirect_to articles_path if logged_in?
  end

  def about
  end 
  
end
