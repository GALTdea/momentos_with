class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id]) if params[:quiz_id]
    if @quiz
      @question = @quiz.questions.build(question_params)
    else
      @question = Question.new(question_params)
    end

    respond_to do |format|
      if @question.save
        format.turbo_stream
        format.html { redirect_to @question, notice: "Question was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_question", partial: "questions/form", locals: { quiz: @quiz, question: @question }) }
        if @quiz
          format.html { render 'quizzes/show', status: :unprocessable_entity }
        else
          format.html { render 'questions/new', status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to @question, notice: 'Question was successfully updated.'
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  def toggle_status
    @question = Question.find(params[:id])
    new_status = @question.status == "active" ? "inactive" : "active"
    @question.update(status: new_status)

    redirect_back(fallback_location: questions_path)
  end

  private
  def question_params
    params.require(:question).permit(:text, :question_type, :options, :category, :sequence_number, :active, :quiz_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
