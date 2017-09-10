class AddIndexToFollowing < ActiveRecord::Migration[5.1]
  def change
    add_index :followings, :user_id
    add_index :followings, :event_id
    add_index :followings, [:user_id, :event_id], unique: true
  end
end
