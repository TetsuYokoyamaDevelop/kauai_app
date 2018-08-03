class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create, :showPostHistory]

  # GET /users
  # GET /users.json

  #テスト用
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def showPostHistory
    @microposts = Micropost.where(user_id: current_user.id).all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,:nickname, :gender, :birthday, :introduction)
    end

end
