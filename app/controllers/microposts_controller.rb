class MicropostsController < ApplicationController
    before_action :set_micropost, only: [:show, :edit, :update, :destroy]

    # GET /profiles
    # GET /profiles.json
    def index
      @microposts= Micropost.all
    end

    # GET /profiles/1
    # GET /profiles/1.json
    def show
    end

    # GET /profiles/new
    def new
      @micropost = Micropost.new
    end

    # GET /profiles/1/edit
    def edit
    end

    # POST /profiles
    # POST /profiles.json
    def create
      @micropost = Micropost.new(micropost_params)

      if @micropost.save
        redirect_to @micropost
      else
        render 'new'
      end
    end

    # PATCH/PUT /profiles/1
    # PATCH/PUT /profiles/1.json
    def update
      @micropost = Micropost.find(params[:id])

      if @micropost.update(micropost_params)
        redirect_to @micropost
      else
        render 'edit'
      end
    end

    # DELETE /profiles/1
    # DELETE /profiles/1.json
    def destroy
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
