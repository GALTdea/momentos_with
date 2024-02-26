class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.references :child, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.text :response
      t.date :conversation_date
      t.text :notes

      t.timestamps
    end
  end
end
