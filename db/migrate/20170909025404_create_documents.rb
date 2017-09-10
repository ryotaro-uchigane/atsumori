class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :event, null: false
      t.text :file_name, null: false
      t.text :path, null: false

      t.timestamps
    end
  end
end
