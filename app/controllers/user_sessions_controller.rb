class UserSessionsController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:microposts, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインできませんでした'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'ログアウトしました')
  end

end
