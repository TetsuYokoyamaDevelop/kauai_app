class MicropostsController < ApplicationController
    before_action :require_login
    before_action :set_micropost, only: [:show, :edit, :update, :destroy]
    before_action :indicate_current_user, only: [:new, :edit, :post_history, :update, :destroy]
    before_action :check_correct_user, only: [:edit, :destroy]

    def index
      @microposts = Micropost.all
    end

    def show
    end

    def new
      @micropost = Micropost.new
    end

    def edit
    end

    def post_history
      @microposts = @user.microposts.all
    end

    def create
      @micropost = Micropost.where(user_id: current_user.id).new(micropost_params)
      if @micropost.save
        flash[:success] = "ツイートしました!"
        redirect_to microposts_path
      else
        flash[:alert] = "ツイートできませんでした!"
        redirect_to new_micropost_path
      end
    end

    def update
        if @micropost.update(micropost_params)
          flash[:success] = "更新しました"
          redirect_to microposts_path
        else
          flash[:alert] = "更新できませんでした"
          render :edit
        end
    end

    def destroy
      @micropost.destroy
      flash[:success] = "Micropost destroyed"
      redirect_to post_history_microposts_path
    end

    private

      def check_correct_user
        unless @micropost.user_id == current_user.id
          flash[:alert] = "You do not have permission"
          render :show
        end
      end

      def indicate_current_user
        @user = current_user
      end

      def set_micropost
        @micropost = Micropost.find(params[:id])
      end

      def micropost_params
        params.require(:micropost).permit(:id,:text, :tag, :user_id)
      end

end
