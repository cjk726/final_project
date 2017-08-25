require 'open-uri'

class PoolTablesController < ApplicationController
  
  def bookmarks
    @pool_tables = current_user.bookmarked_pool_tables
    @pool_table = PoolTable.new

    render("pool_tables/bookmarked_pool_tables.html.erb")
  end
  
  def index
    @pool_tables = PoolTable.all
    @pool_table = PoolTable.new
    @bookmark = Bookmark.new
    render("pool_tables/index.html.erb")
  end

  def show
    @pool_table = PoolTable.find(params[:id])
    @street_address = @pool_table.venue.address
    
    street_address_nospaces=@street_address.gsub(" ","+")
    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+street_address_nospaces
    parsed_data = JSON.parse(open(url).read)
    # @lat = 44.540 
    # @lng = -78.546
    
    @lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
    
    render("pool_tables/show.html.erb")
  end

  def new
    @pool_table = PoolTable.new

    render("pool_tables/new.html.erb")
  end

  def create
    @pool_table = PoolTable.new

    @pool_table.pool_table_name = params[:pool_table_name]
    @pool_table.price = params[:price]
    @pool_table.size = params[:size]
    @pool_table.pool_table_pic = params[:pool_table_pic]
    @pool_table.venue_id = params[:venue_id]

    save_status = @pool_table.save

    if save_status == true
      redirect_to("/pool_tables", :notice => "Pool table created successfully.")
      # redirect_to("/pool_tables/#{@pool_table.id}", :notice => "Pool table created successfully.")
    else
      render("pool_tables/new.html.erb")
    end
  end

  def edit
    @pool_table = PoolTable.find(params[:id])

    render("pool_tables/edit.html.erb")
  end

  def update
    @pool_table = PoolTable.find(params[:id])

    @pool_table.pool_table_name = params[:pool_table_name]
    @pool_table.price = params[:price]
    @pool_table.size = params[:size]
    @pool_table.pool_table_pic = params[:pool_table_pic]
    @pool_table.venue_id = params[:venue_id]

    save_status = @pool_table.save

    if save_status == true
      redirect_to("/pool_tables", :notice => "Pool table created successfully.")
      # redirect_to("/pool_tables/#{@pool_table.id}", :notice => "Pool table updated successfully.")
    else
      render("pool_tables/edit.html.erb")
    end
  end

  def destroy
    @pool_table = PoolTable.find(params[:id])

    @pool_table.destroy

    if URI(request.referer).path == "/pool_tables/#{@pool_table.id}"
      redirect_to("/", :notice => "Pool table deleted.")
    else
      redirect_to("/pool_tables", :notice => "Pool table deleted.")
    end
  end
end
