class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).order(created_at: :desc)
    @post = Post.new
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(user_two: current_user))
    authorize @chatrooms
    @user = current_user
    @following = Follow.where(follower_id: current_user.id)
    if params["param"].present?
      @posts = policy_scope(Post).select { |post| post.user.tags == current_user.tags }
    end

    if params["param_event"].present?
      @posts = policy_scope(Post).select { |post| post.tags.first.name == "Events" }
    end

    if params["param_highlight"].present?
      @posts = policy_scope(Post).select { |post| post.tags.first.name == "Highlights" }
      @css_class = "selected"
    end

    if params["param_searching"].present?
      @posts = policy_scope(Post).select { |post| post.tags.first.name == "Team Searching" }
    end
  end

  # def new

  # end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])

    @likes = @post.likes.count

    @comment = Comment.new
    @comments = Comment.where(post: @post)
    authorize @post
  end

  # def like
  #   @post = Post.all.find(params[:id])
  #   Like.create(user_id: current_user.id, post_id: @post.id)
  #   redirect_to post_path(@post)
  #   authorize @post
  # end

  private

  def post_params
    params.require(:post).permit(:content, :photo, :video, :tag_list)
  end
end
