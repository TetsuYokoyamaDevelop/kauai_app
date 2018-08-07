class MicropostsController < ApplicationController
    before_action :require_login
    before_action :set_micropost, only: [:edit, :update, :destroy]

    def index
      @microposts = Micropost.all
    end

    def show
      @user = current_user
      @microposts = @user.microposts.all
    end

    def new
      @user = current_user
      @micropost = Micropost.new
    end

    def edit
      @user = current_user
    end

    def create
      @user = current_user
      @micropost = @user.microposts.new(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to microposts_path
      else
        render 'new'
      end
    end

    def update
      @user = current_user
        if @micropost.update(micropost_params)
          flash[:success] = "Micropost updated"
          redirect_to microposts_path
        else
          render 'edit'
        end
    end

    def destroy
        if @micropost.user_id == current_user.id
        @micropost.destroy
        redirect_to microposts_path
        else
          render 'show'
        end
    end

    private

      def current_user
        @user = current_user
      end

      def set_micropost
        @micropost = Micropost.find(params[:id])
      end

      def micropost_params
        params.require(:micropost).permit(:id,:text, :tag, :user_id)
      end

end
