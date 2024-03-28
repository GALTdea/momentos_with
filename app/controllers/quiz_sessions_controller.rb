class QuizSessionsController < ApplicationController
  before_action :set_quiz, only: [:new, :create]
  before_action :set_quiz_session, only: [:show, :update]
  before_action :authenticate_user!

  def new
    @quiz = Quiz.last
    @quiz_session = QuizSession.new
    @has_children = current_user.children.exists?
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
    last_question_id = @quiz_session.answers.last&.question_id
    quiz = @quiz_session.quiz

    if last_question_id
      current_question = quiz.questions.find(last_question_id)
      next_question = find_next_question(quiz, current_question)
      # next_question = find_next_question(Question.find(last_question_id))
    else
      next_question = @quiz_session.quiz.questions.first
    end

    # Use @question to match the view's expectation
    @question = next_question

    if @question
      render 'questions/show' # Render the question view
    else
      @quiz_session.update(status: 'completed') # Update quiz session status if needed
      redirect_to quiz_session_path(@quiz_session), notice: 'Quiz completed!'
    end
  end

private
  def find_next_question(quiz, current_question)
    questions = quiz.questions.order(:id).to_a
    current_index = questions.index(current_question)
    questions[current_index + 1] # This will return nil if current_question is the last one, which is handled in your start action.
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_quiz_session
    @quiz_session = QuizSession.find(params[:id])
  end

  def quiz_session_params
    params.require(:quiz_session).permit(:child_id,:quiz_id)
  end
end
