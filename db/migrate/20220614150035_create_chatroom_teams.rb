class CreateChatroomTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :chatroom_teams do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end
