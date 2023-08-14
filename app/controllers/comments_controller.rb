class CommentsController < ApplicationController
  def index
    @comments = policy_scope(Comment)
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to comments_path
  end

  # def show
  #   @comment = comment.find(params[:id])
  #   authorize @comment
  # end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
