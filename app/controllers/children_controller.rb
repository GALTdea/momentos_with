class ChildrenController < ApplicationController
  before_action :set_child, only: %i[ show edit update destroy ]

  after_action :verify_authorized, except: :index
  def index
    @children = policy_scope(Child)
  end

  # GET /children/1 or /children/1.json
  def show
    authorize @child
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
    authorize @child
  end

  # POST /children or /children.json
  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id

    respond_to do |format|
      if @child.save
        format.html { redirect_to child_url(@child), notice: "Child was successfully created." }
        format.json { render :show, status: :created, location: @child }

        # Update the quiz session form part of the page
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("quiz_session_form",
            partial: "quiz_sessions/form",
            locals: { quiz: Quiz.find(params[:quiz_id]), current_user: current_user })
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_child_frame", partial: "children/form", locals: { child: @child }) }
      end
    end
  end


  # PATCH/PUT /children/1 or /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to child_url(@child), notice: "Child was successfully updated." }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1 or /children/1.json
  def destroy
    @child.destroy!

    respond_to do |format|
      format.html { redirect_to children_url, notice: "Child was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def child_params
      params.require(:child).permit(:name, :description, :user_id, :birthdate, :gender, :profile)
    end
end
