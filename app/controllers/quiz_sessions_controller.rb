class QuizSessionsController < ApplicationController
  before_action :set_quiz, only: [:new, :create]
  before_action :set_quiz_session, only: [:show, :update]

  def new
    @quiz = Quiz.last
    @quiz_session = QuizSession.new
  end

  def create
    @quiz_session = QuizSession.new(quiz_session_params)
    @quiz_session.quiz_id = @quiz.id
    if @quiz_session.save
      redirect_to questions_path, notice: "Question Session created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
  end

  def update
  end


private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_quiz_session
    @quiz_session = QuizSession.find(params[:id])
  end

  def quiz_session_params
    params.require(:quiz_session).permit(:child_id,:quiz_id )
  end
end
