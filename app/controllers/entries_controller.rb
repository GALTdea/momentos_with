class EntriesController < ApplicationController
  before_action :set_entry

  def create
    @child = Child.find(params[:child_id])

    @entry = Entry.new(entry_params)
    @entry = @child.entries.build(entry_params)
    @entry.user_id = current_user.id

    respond_to do |format|
      if @entry.save
        format.html { redirect_to child_url(@child), notice: "Entry was successfully created." }
        # format.turbo_stream
      end
    end
  end

  def show
  end

  private
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:child_id, :prompt_id, :response, :conversation_date, :notes)
  end
end
