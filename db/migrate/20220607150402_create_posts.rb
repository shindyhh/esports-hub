class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :content
      t.text :media
      t.timestamps
    end
  end
end
