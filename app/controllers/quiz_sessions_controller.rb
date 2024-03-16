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
      # Redirect to the 'start' action for the newly created quiz_session
      redirect_to start_quiz_session_path(@quiz_session), notice: "Quiz session created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
  end

  def update
  end

  def start
    @quiz_session = QuizSession.find(params[:id])
    @quiz_session.start!
    redirect_to @quiz_session

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
