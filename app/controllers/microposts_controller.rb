class MicropostsController < ApplicationController
    before_action :require_login, only: [:create, :edit, :update, :destroy]
    # GET /profiles
    # GET /profiles.json
    def index
      @microposts = Micropost.all
    end

    # GET /profiles/new
    def new
      @user = current_user
      @micropost = Micropost.where(user_id: current_user.id).new
    end

    def edit
      @user = current_user
      @micropost = @user.microposts.find(params[:id])
    end
    # POST /profiles
    # POST /profiles.json
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
      @user = User.find_by(current_user.id)
      @micropost = @user.microposts.find(params[:id])

        if @micropost.update(micropost_params)
          flash[:success] = "Micropost updated"
          redirect_to microposts_path
        else
          render 'edit'
        end
    end

    def destroy
      @user = User.find(current_user.id)
      @micropost = @user.microposts.find_by(user_id: current_user.id)
      @micropost.destroy
      redirect_to microposts_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_micropost
        @micropost = Micropost.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def micropost_params
        params.require(:micropost).permit(:text, :tag, :user_id)
      end

end
