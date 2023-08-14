class MessageTeamsController < ApplicationController

  def create
    @chatroom_team = ChatroomTeam.find(params[:chatroom_team_id])
    @message_team = MessageTeam.new(message_params)
    @message_team.chatroom_team = @chatroom_team
    @message_team.user = current_user
    authorize @message_team
    if @message_team.save
      ChatroomTeamChannel.broadcast_to(
        @chatroom_team,
        render_to_string(partial: "message_teams/message_team", locals: { message_team: @message_team })
      )
      redirect_to chatroom_team_path(@chatroom_team, anchor: "message-#{@message_team.id}")
    else
      render "chatroom_teams/show"
    end
  end

  private

  def message_params
    params.require(:message_team).permit(:content)
  end
end
