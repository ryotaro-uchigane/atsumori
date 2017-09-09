class AddColumnToentrySheet < ActiveRecord::Migration[5.1]
  def change
    add_column :entrysheets, :public, :boolean, default: false, null: false
  end
end
