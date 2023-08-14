class CreateMessageTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :message_teams do |t|
      t.string :content
      t.references :chatroom_team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
