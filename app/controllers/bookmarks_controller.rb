class BookmarksController < ApplicationController
  def new
    # pass the list.id to the view (form)
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # associate the list.id
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    # associate bookmark and list.id
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to list_path(@bookmark.list), status: :see_other, notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
