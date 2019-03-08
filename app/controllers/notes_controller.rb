class NotesController < ApplicationController

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to user_note(@current_user.id)
    else
      redirect_to user_note_path
    end
  end


  private 
    def note_params
      params.require(:note).permit(:title, :content)
    end

end
