class Team < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_one :chatroom_team
  after_create :create_chatroom
  has_one_attached :team_avatar

  def create_chatroom
    @chatroom_team = ChatroomTeam.create(name: self.title, team: self)
  end

  def avatar_thumbnail
    "https://res.cloudinary.com/juliocb01/image/upload/v1655333627/PuPu/Avatar%20Placeholder/898_owdg1y.png"
  end
end
