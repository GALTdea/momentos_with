class Question < ApplicationRecord
  serialize :options, Array, coder: JSON

  has_many :quiz_questions, dependent: :destroy
  has_many :quizzes, through: :quiz_questions

  has_rich_text :text

  enum status: { inactive: "inactive", active: "active" }
end
