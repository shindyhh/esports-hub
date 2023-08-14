class ChatroomTeam < ApplicationRecord
  has_many :message_teams
  belongs_to :team
end
