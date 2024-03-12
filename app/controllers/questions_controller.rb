class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  def index
  end

  def show
  end

  def new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.turbo_stream
        format.html { redirect_to @quiz }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_question", partial: "questions/form", locals: { quiz: @quiz, question: @question }) }
        format.html { render 'quizzes/show', status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private

  def question_params
    params.require(:question).permit(:text, :quiz_id, :_destroy, answers_attributes: [:id, :text, :correct, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
