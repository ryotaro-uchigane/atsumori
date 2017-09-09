class AddColumnToentrySheet < ActiveRecord::Migration[5.1]
  def change
    add_column :entrysheet, :public, :boolean, default: false, null: false
  end
end
