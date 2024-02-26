class EntriesController < ApplicationController
  before_action :set_child

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id

    if @entry.save
      redirect_to child_path(@child), notice: "Entry was successfully created."
    end

    # debugger
    # respond_to do |format|
    #   if @entry.save
    #     # format.html { redirect_to user_path(current_user), notice: "Entrie was successfully created." }
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.replace(@entry, partial: "entries/entry", locals: { entry: @entry })
    #     end
    #   end
    # end

    # if @entry.update(entry_params)
    #     respond_to do |format|
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.replace(dom_id(@entry), partial: "entries/entry", locals: { entry: @entry })
    #     end
    #     format.html { redirect_to child_path(@entry.child), notice: 'Entry was successfully updated.' }
    #   end
    # end

  end


  private
  def set_child
     @child = Child.find(params[:child_id])
    # @child = Child.find(params[:entry][:child_id])
  end

  def entry_params
    params.require(:entry).permit(:child_id, :prompt_id, :response, :conversation_date, :notes)
  end
end
