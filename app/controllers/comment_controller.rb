class CommentController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @comments= Comment.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @micropost = Comment.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @Comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @comment = Comment.find(params[:id])

    if @micropost.update(micropost_params)
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @comment = micropost.find(params[:id])
    @comment.destroy
    redirect_to microposts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:replyment, :user_id)
    end
end
