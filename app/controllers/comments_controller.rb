class CommentsController < ApplicationController
  before_action :set_comment, only: [ :show, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @comments= Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
      @comment = Comment.find(params[:id])
  end

  # GET /profiles/new
  def new
    @comment = Comment.new
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to comments_path
    else
      render 'new'
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @comment.destroy
    redirect_to comments_path
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
