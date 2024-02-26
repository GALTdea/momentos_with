class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.date :birthdate
      t.string :gender
      t.text :profile

      t.timestamps
    end
  end
end
