class UsersController < ApplicationController
  before_filter :authorize

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find( params[:id] )

    if @user.update_attributes( params[:user] )
      redirect_to users_path, notice: "Updated user."
    else
      render action: "edit"
    end

  end

  def destroy
    @user= User.find( params[:id] )
    @user.destroy

    redirect_to users_path, notice: "User Deleted"
  end

end
