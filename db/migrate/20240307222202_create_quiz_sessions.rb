class CreateQuizSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_sessions do |t|
      t.references :child, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.string :score
      t.string :status

      t.timestamps
    end
  end
end
