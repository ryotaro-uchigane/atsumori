class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :entrysheet_id
      t.text :email, :null => false
      t.text :password, :null => false
      t.text :role, :null => false

      t.timestamps
    end
  end
end
