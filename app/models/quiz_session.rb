class QuizSession < ApplicationRecord
  belongs_to :child
  belongs_to :quiz
  has_many :answers


  def next_question
    # Simple example: Get the next question by sequence that hasn't been answered yet
    answered_question_ids = self.answers.pluck(:question_id)
    self.quiz.questions.where.not(id: answered_question_ids).order(:sequence_number).first
  end
end
