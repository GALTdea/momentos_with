class AnswersController < ApplicationController

  def create
    @quiz_session = QuizSession.find(params[:quiz_session_id])
    @answer = @quiz_session.answers.build(answer_params)

    if @answer.save
      # Redirect to the next question, show a success message, etc.
    else
      # Handle the error, perhaps re-rendering the question page with an error message.
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:selected_option, :question_id)
  end

end
