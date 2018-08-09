class MicropostsController < ApplicationController
    before_action :require_login
    before_action :set_micropost, only: [:edit, :update, :destroy]

    def index
      @microposts = Micropost.all
    end

    def show
      @micropost = Micropost.find_by(id: params[:id])
    end

    def new
      @user = current_user
      @micropost = Micropost.new
    end

    def edit
      @user = current_user
        unless @micropost.user_id == current_user.id
          flash[:alert] = "You cannot edit this micropost"
          render 'show'
        end
    end

    def create
      @micropost = Micropost.where(user_id: current_user.id).new(micropost_params)
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
        @user = current_user
        if @micropost.user_id == current_user.id
          @micropost.destroy
          redirect_to microposts_path
        else
          flash[:alert] = "You cannot destroy this micropost"
          render 'show'
        end
    end

    private

      def set_micropost
        @micropost = Micropost.find(params[:id])
      end

      def micropost_params
        params.require(:micropost).permit(:id,:text, :tag, :user_id)
      end

end
