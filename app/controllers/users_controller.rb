class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create]

  #テスト用
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:success] = "Profile updated"
        redirect_to microposts_path
      else
        render 'edit'
      end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,:nickname, :gender, :birthday, :introduction)
    end

end
