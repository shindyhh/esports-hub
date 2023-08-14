class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow = @user.followers.find_by(follower: current_user)
    @posts = Post.where(user: @user)
    @comment = Comment.new
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(user_two: current_user))
    authorize @chatrooms
    @following = Follow.where(follower_id: current_user.id)
    authorize @user
  end
end
