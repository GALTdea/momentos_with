class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.string :total_questions
      t.string :category
      t.string :active

      t.timestamps
    end
  end
end
