class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :text
      t.string :question_type
      t.text :options
      t.string :category
      t.string :sequence_number
      t.string :active
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
