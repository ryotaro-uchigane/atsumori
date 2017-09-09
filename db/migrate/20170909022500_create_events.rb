class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
