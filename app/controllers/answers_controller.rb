class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:answer][:question_id]
    @answer.quiz_session_id = params[:answer][:quiz_session_id]

    if @answer.save
      next_question = @answer.quiz_session.next_question

      if next_question
        redirect_to action: :start, controller: 'quiz_sessions', id: @answer.quiz_session_id, notice: 'Your answer was successfully recorded.'
      else
        redirect_to quiz_completion_path(@answer.quiz_session), notice: 'Quiz completed!'
      end
    else
      render 'questions/show', status: :unprocessable_entity
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:options, :question_id, :quiz_session_id, :text, :user_id, :selected_option)
  end
end
