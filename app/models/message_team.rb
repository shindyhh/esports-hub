class MessageTeam < ApplicationRecord
  belongs_to :chatroom_team
  belongs_to :user
end
