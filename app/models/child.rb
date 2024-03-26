class Child < ApplicationRecord
  attr_accessor :quiz_id, :from_quiz_session

  belongs_to :user
  has_many :quiz_sessions, dependent: :destroy
  has_many :entries, dependent: :destroy

  after_create :create_quiz_session

  def create_quiz_session
    QuizSession.create(child_id: self.id, quiz_id: self.quiz_id) if self.quiz_id.present?
  end
end
