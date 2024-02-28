class EntriesController < ApplicationController
  before_action :set_child

  def create
    @entry = Entry.new(entry_params)
    @entry = @child.entries.build(entry_params)
    @entry.user_id = current_user.id

    respond_to do |format|
      if @entry.save
        format.turbo_stream
      end
    end
  end

  private
  def set_child
    @child = Child.find(params[:child_id])
  end

  def entry_params
    params.require(:entry).permit(:child_id, :prompt_id, :response, :conversation_date, :notes)
  end
end
