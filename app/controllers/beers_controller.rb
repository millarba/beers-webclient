class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create(name: params[:name], 
                        style: params[:style],
                        ibu: params[:ibu],
                        alcohol: params[:alcohol]
                        )

    redirect_to "/beers/#{@beer.id}"
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(name: params[:name],
                 style: params[:style],
                 ibu: params[:ibu],
                 alcohol: params[:alcohol])

    redirect_to "/beers/#{@beer.id}"
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.delete

    redirect_to '/beers'
  end
end
