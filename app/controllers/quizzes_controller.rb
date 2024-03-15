class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update]

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

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :total_questions, :active, :category)
  end
end
