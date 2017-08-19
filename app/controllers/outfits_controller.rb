class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all

    render("outfits/index.html.erb")
  end

  def show
    @outfit = Outfit.find(params[:id])
    @comfortzone = ComfortZone.all
    render("outfits/show.html.erb")
  end

  def new
    @outfit = Outfit.new
    @comfortzone = ComfortZone.new
    render("outfits/new.html.erb")
  end

  def create
    @outfit = Outfit.new
    @outfit.user_id = current_user.id
    @outfit.comfort_zone_id = params[:comfort_zone_id]

    save_status = @outfit.save

    if save_status == true
      redirect_to("/users/<%= current_user.id %>", :notice => "Outfit created successfully.")
    else
      render("outfits/new.html.erb")
    end
  end

  def edit
    @outfit = Outfit.find(params[:id])

    render("outfits/edit.html.erb")
  end

  def update
    @outfit = Outfit.find(params[:id])

    @outfit.user_id = params[:user_id]
    @outfit.comfort_zone_id = params[:comfort_zone_id]

    save_status = @outfit.save

    if save_status == true
      redirect_to("/outfits/#{@outfit.id}", :notice => "Outfit updated successfully.")
    else
      render("outfits/edit.html.erb")
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])

    @outfit.destroy

    if URI(request.referer).path == "/outfits/#{@outfit.id}"
      redirect_to("/", :notice => "Outfit deleted.")
    else
      redirect_to("/outfits", :notice => "Outfit deleted.")
    end
  end
end
