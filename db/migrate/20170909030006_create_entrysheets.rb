class CreateEntrysheets < ActiveRecord::Migration[5.1]
  def change
    create_table :entrysheets do |t|
      t.integer :user_id
      t.text :name, null: false
      t.integer :age, null: false
      t.text :sex, null: false

      t.timestamps
    end
  end
end
