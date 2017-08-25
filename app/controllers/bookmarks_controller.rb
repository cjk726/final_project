class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all

    render("bookmarks/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/show.html.erb")
  end

  def new
    @bookmark = Bookmark.new

    render("bookmarks/new.html.erb")
  end

  def create
    @bookmark = Bookmark.new

    @bookmark.venue_id = params[:venue_id]
    @bookmark.pool_table_id = params[:pool_table_id]
    @bookmark.user_id = current_user.id    
    # @bookmark.comments = params[:comments]

    save_status = @bookmark.save

    if save_status == true
      redirect_to("/my_pool_tables", :notice => "Bookmark created successfully.")
    else
      redirect_to("/pool_tables")
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/edit.html.erb")
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.venue_id = params[:venue_id]
    @bookmark.pool_table_id = params[:pool_table_id]
    @bookmark.user_id = current_user.id
    @bookmark.comments = params[:comments]

    save_status = @bookmark.save

    if save_status == true
      redirect_to("/bookmarks/#{@bookmark.id}", :notice => "Bookmark updated successfully.")
    else
      render("bookmarks/edit.html.erb")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    if URI(request.referer).path == "/bookmarks/#{@bookmark.id}"
      redirect_to("/", :notice => "Bookmark deleted.")
    else
      redirect_to(:back, :notice => "Bookmark deleted.")
    end
  end
end
