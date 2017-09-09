class RemoveColomnToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :entrysheet_id, :integer
  end
end
