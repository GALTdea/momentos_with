class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    respond_to do |format|
      if @quiz.save
        redirect_to @quiz
      else
        render :new
      end
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
    params.require(:quiz).permit(:title, :description)
  end
end
