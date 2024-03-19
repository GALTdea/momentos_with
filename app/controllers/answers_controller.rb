class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:answer][:question_id]
    @answer.quiz_session_id = params[:answer][:quiz_session_id]

    if @answer.save
      next_question = @answer.quiz_session.next_question

      if next_question
        # Redirect to the next question's show page
        redirect_to question_path(next_question), notice: 'Your answer was successfully recorded.'
      else
        # Handle end of quiz, e.g., show results or a completion message
        redirect_to quiz_completion_path(@answer.quiz_session), notice: 'Quiz completed!'
      end
    else
      # Handle the error, perhaps by rendering the current question again with an error message
      render 'questions/show', status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:options, :question_id, :quiz_session_id, :text, :user_id, :selected_option)
    # Ensure these parameters match what your form is sending
  end
end
