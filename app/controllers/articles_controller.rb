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

  def new

  end

  def create
   # render plain: params[:article] # render to UI  
   #@article = Article.new(params.require[:article])
   @article = Article.new(params.require(:article).permit(:title, :description))
   @article.save # save to table articles

   # redirect will redirect to show based on following the routes it took "rails routes --expanded" articles#show
   redirect_to article_path(@article)  # rails will extract id from @article and pass it to article_path
  end 
end
