class QuizSession < ApplicationRecord
  belongs_to :child
  belongs_to :quiz
end
