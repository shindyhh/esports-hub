class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(user_two: current_user))
    authorize @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @user_two = User.find(params[:user_id])
    name = "#{current_user.username} - #{@user_two.username}"
    @chatroom = Chatroom.new(name: name, user: current_user, user_two: @user_two)
    authorize @chatroom
    if @chatroom.save
      redirect_to @chatroom
    else
      redirect_to rooth_path, notice: "Sorry, Chat could not be created"
    end
  end
end
