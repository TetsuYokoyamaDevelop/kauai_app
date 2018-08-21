class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :set_comment, only: [ :destroy, :show]
  before_action :set_micropost, only: [:index, :show, :new, :create, :destroy]

  def index
    @comments = @micropost.comments.all
  end

  def show
  end

  def new
    @user = current_user
    @comment = @micropost.comments.new
  end

  def create
    @user = current_user
    @comment = @micropost.comments.where(user_id: current_user.id).new(comment_params)
      if @micropost.save
        flash[:success] = "リプライしました"
        redirect_to micropost_comments_path
      else
        flash[:alert] = "リプライできませんでした"
        redirect_to new_micropost_comment_path
      end
  end

  def destroy
      if @comment.user_id == current_user.id
        @comment.destroy
        redirect_to micropost_comments_path
      else
        flash[:alert] = "このコメントは削除できません"
        render :show
      end
  end

  private

    def set_micropost
      @micropost = Micropost.find_by(id: params[:micropost_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:replyment, :user_id)
    end

end
