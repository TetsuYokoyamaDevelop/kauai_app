class MicropostsController < ApplicationController
    before_action :require_login
    before_action :set_micropost, only: [:show, :edit, :update, :destroy]
    before_action :indicate_current_user, only: [:new, :edit, :update, :destroy]

    def index
      @microposts = Micropost.all
    end

    def show
    end

    def new
      @micropost = Micropost.new
    end

    def edit
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
          flash[:alert] = "You cannot destroy this micropost"
          render 'show'
        end
    end

    private

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
