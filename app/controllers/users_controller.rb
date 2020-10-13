class UsersController < ApplicationController
  
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # debugger
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users/ (+ params)
  def create 
    # User.create(params[:user])
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
