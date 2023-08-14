class ChatroomTeamChannel < ApplicationCable::Channel
  def subscribed
    @chatroom_team = ChatroomTeam.find(params[:id])
    stream_for chatroom_team
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
