class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_path, notice: 'New User Created'
    else
      flash.now[:error] = user.errors.full_messages.to_sentence
      render 'new', locals: { user: user }
    end
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'Deleted User'
  end

  def edit
    render 'form', locals: { user: user }
  end

  def index
    users = User.all
    render 'index', locals: { users: users }
  end

  def new
    user = User.new
    render 'form', locals: { user: user }
  end

  def update
    if user.update_attributes(user_params)
      redirect_to edit_user_path(user), notice: 'User Updated'
    else
      flash.now[:error] = user.errors.full_messages.to_sentence
      render 'form', locals: { user: user }
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:avatar, :name)
  end
end
