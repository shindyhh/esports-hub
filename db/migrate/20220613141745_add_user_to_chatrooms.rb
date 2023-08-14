class AddUserToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
    add_reference :chatrooms, :user_two, null: false, foreign_key: {to_table: :users}
  end
end
