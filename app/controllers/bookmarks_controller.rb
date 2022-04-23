class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    set_list
  end

  def create
    set_list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "new"
    end
  end

  def destroy
    set_bookmark
    @bookmark.destroy
  end

private

def set_list
  @list = List.find(params[:list_id])
end

def set_bookmark
  @bookmark = Bookmark.find(params[:id])

end

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id, :list_id)
end

end
