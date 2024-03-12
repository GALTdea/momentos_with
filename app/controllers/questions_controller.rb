class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    # Conditionally find a quiz only if quiz_id is present
    @quiz = Quiz.find(params[:quiz_id]) if params[:quiz_id]

    # Build or create the question depending on the presence of a quiz
    if @quiz
      @question = @quiz.questions.build(question_params)
    else
      # If there's no quiz_id, you might want to create a standalone question or handle it differently
      @question = Question.new(question_params)
    end

    respond_to do |format|
      if @question.save
        format.turbo_stream
        # Redirect differently based on the presence of a quiz
        format.html { redirect_to @quiz || questions_path } # Adjust `questions_path` as necessary
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_question", partial: "questions/form", locals: { quiz: @quiz, question: @question }) }
        # Render differently based on the presence of a quiz
        if @quiz
          format.html { render 'quizzes/show', status: :unprocessable_entity }
        else
          format.html { render 'questions/new', status: :unprocessable_entity } # Adjust this path as necessary
        end
      end
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def question_params
  #   params.require(:question).permit(:text, :quiz_id, :_destroy, answers_attributes: [:id, :text, :correct, :_destroy])
  # end
  def question_params
    params.require(:question).permit(:text, :question_type, :options, :category, :sequence_number, :active)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
