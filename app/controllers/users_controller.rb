class UsersController < ApplicationController

  # this will execute set_article method before everything else & will only trigger for the selected methods only
  before_action :set_user, only: [:show, :edit, :update]

  def show
    #@user = User.find(params[:id])  ## code removed as it is declared now under before_action
    #@articles = @user.articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 30)
  end

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 30)
  end 

  def new
    @user = User.new
  end

  def edit
    # @user = User.find(params[:id])   ## code removed as it is declared now under before_action
  end

  def update
    # @user = User.find(params[:id])   ## code removed as it is declared now under before_action 
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end 
  end 

  def create
    #debugger
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}! You have successfully signed up!"
      redirect_to articles_path
    else
      render 'new'
    end
  end 

  private

  def set_user
    @user = User.find(params[:id])
  end 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end