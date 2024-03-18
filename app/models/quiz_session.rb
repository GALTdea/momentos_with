class QuizSession < ApplicationRecord
  belongs_to :child
  belongs_to :quiz
  has_many :answers
end
