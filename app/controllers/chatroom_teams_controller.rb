class ChatroomTeamsController < ApplicationController

  def show
    # @team = Team.find(params[:team_id])
    @chatroom_team = ChatroomTeam.find(params[:id])
    authorize @chatroom_team
    @message_team = MessageTeam.new
  end
end
