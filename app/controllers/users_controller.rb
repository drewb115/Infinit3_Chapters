class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # Edit action to render the edit form
  def edit
  end

  # Update action to handle the form submission
  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    else
      redirect_to admin_users_path, alert: 'User could not be deleted.'
    end
  rescue ActiveRecord::InvalidForeignKey
    # Redirect with a custom message if there are dependent records
    redirect_to admin_users_path, alert: 'User has associated records and cannot be deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :address, :password, :password_confirmation, :province)
    # Notice that I've added :province here, since it was missing previously
  end
end
