class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
      if @quiz.save
        redirect_to @quiz, notice: 'Quiz was successfully created.'
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  def add_questions
    @quiz = Quiz.find(params[:id])
    @quiz.question_ids = params[:quiz][:question_ids]

    if @quiz.save
      # Handle success (perhaps redirect or re-render the component to show the updated list of questions)
    else
      # Handle failure
    end
  end


  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :total_questions, :active, :category)
  end
end
