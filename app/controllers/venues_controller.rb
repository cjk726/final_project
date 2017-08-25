class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    @venue = Venue.new

    render("venues/index.html.erb")
  end

  def show
    @venue = Venue.find(params[:id])
    
    @street_address = @venue.address
    
    street_address_nospaces=@street_address.gsub(" ","+")
    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+street_address_nospaces
    parsed_data = JSON.parse(open(url).read)
    # @lat = 44.540 
    # @lng = -78.546
    
    @lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @lng = parsed_data["results"][0]["geometry"]["location"]["lng"]

    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new
    @neighborhoods = Neighborhood.all
    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.venue_name = params[:venue_name]
    @venue.address = params[:address]
    @venue.neighborhood_id = params[:neighborhood_id]
    @venue.ambience = params[:ambience]
    @venue.pool_table_id = params[:pool_table_id]

    save_status = @venue.save

    if save_status == true
      redirect_to("/venues", :notice => "Venue created successfully.")
      # redirect_to("/venues#{@venue.id}", :notice => "Venue created successfully.")
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.venue_name = params[:venue_name]
    @venue.address = params[:address]
    @venue.neighborhood_id = params[:neighborhood_id]
    @venue.ambience = params[:ambience]
    @venue.pool_table_id = params[:pool_table_id]

    save_status = @venue.save

    if save_status == true
      redirect_to("/venues", :notice => "Venue updated successfully.")
      # redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_to("/venues", :notice => "Venue deleted.")
    end
  end
end
