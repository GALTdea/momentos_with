class ChildrenController < ApplicationController
  before_action :set_child, only: %i[ show edit update destroy ]

  after_action :verify_authorized, except: :index
  def index
    @children = policy_scope(Child)
  end

  # GET /children/1 or /children/1.json
  def show
    # @entry_to_complete = @child.entries.where(user_id: current_user.id).where(response: nil).first
    @entry_to_complete = @child.entries.first
    authorize @child
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children or /children.json
  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    respond_to do |format|
      if @child.save
        @child.entries.create!(user_id: current_user.id, prompt_id: "1", response: "I played outside and made a new friend.", conversation_date: Date.today, notes: "He was very excited about his new friend.")
        format.html { redirect_to child_url(@child), notice: "Child was successfully created." }
        format.json { render :show, status: :created, location: @child }
        # format.turbo_stream {  } # Update necessary parts of the page
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
        # format.turbo_stream {  } # Handle errors, maybe update the form to display them
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
