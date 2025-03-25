class ArticlesController < ApplicationController
  
  # this will call show.html.erb found under views/articles folder
  def show
    #debugger
    # @article is an instance variable that can be accessed outside (in show.html.erb) of this code block
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end 

end
