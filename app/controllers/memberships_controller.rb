class MembershipsController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    @user = current_user
    @membership = Membership.new(user: @user, team: @team)
    authorize @membership

    if @membership.save
      redirect_to @team, notice: "Congratulations! You are a new Team member"
    else
      redirect_to @team, notice: "Currently not able to join this Team"

    end
  end
end
