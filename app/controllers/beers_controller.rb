class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end


  def new

  end

  def create
    @beer = Unirest.post( "#{ ENV[ "API_HOST_URL" ]}/api/v2/beers",
                          headers: {"Accept" => "application/json"},
                          parameters: { name: params[:name], 
                                        style: params[:style],
                                        ibu: params[:ibu],
                                        alcohol: params[:alcohol]
                                      }).body
    redirect_to "/beers/#{@beer["id"]}"
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Unirest.get("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{params[:id]}.json").body
  end

  def update
    @beer = Unirest.patch(
                          "#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{params[:id]}.json",
                          headers: {"Accept" => "application/json"},
                          parameters: {name: params[:name],
                                       style: params[:style],
                                       ibu: params[:ibu],
                                       alcohol: params[:alcohol]} 
                                                        ).body
    redirect_to "/beers/#{@beer["id"]}"
  end

  def destroy
    @beer = Beer.delete(params[:id])

    redirect_to '/beers'
  end
end
