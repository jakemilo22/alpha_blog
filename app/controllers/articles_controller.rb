class ArticlesController < ApplicationController

  # this will execute set_article method before everything else & will only trigger for the selected methods only
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # this will call show.html.erb found under views/articles folder
  def show
    #debugger
    # @article is an instance variable that can be accessed outside (in show.html.erb) of this code block

  end

  def index
    @articles = Article.all
  end 

  def new
    # 
    @article = Article.new 
  end

  def edit
    # @article is an instance variable that can be accessed outside (in edit.html.erb) of this code block
  end

  def create
    # render plain: params[:article] # render to UI  
    #@article = Article.new(params.require[:article])
    @article = Article.new(article_params) # changed logic to use new article_params method
    @article.user = User.first
    # validation approach if @article.save has no errors then redirect
    if @article.save # save to table articles

      # flash = display message via views/layouts/application.html.erb body
      flash[:notice] = "Article created successfully."

      # redirect will redirect to show based on following the routes it took "rails routes --expanded" articles#show
      redirect_to article_path(@article)  # rails will extract id from @article and pass it to article_path
    else
      # render new form again - showing validation messages (via new.html.erb)
      render 'new' 
    end 
  end 
  
  def update
    # update edited record
    if @article.update(article_params)  # changed logic to use new article_params method
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end 
  end 

  def destroy
    # @article is an instance variable that can be accessed outside (in destroy.html.erb) of this code block
    @article.destroy
    redirect_to articles_path # articles is taken from "rails routes -- expanded" prefix Route 5
  end 

  private

  def set_article
    @article = Article.find(params[:id])
  end 

  def article_params
    params.require(:article).permit(:title, :description)
  end 
end
