class Beer
  attr_accessor :id, :name, :style, :ibu, :alcohol

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @style = hash["style"]
    @ibu = hash["ibu"]
    @alcohol = hash["alcohol"]
  end

  def self.all
    beers_collection = []
    api_beers = Unirest.get("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers.json").body
    api_beers.each do |beer_hash|
      beers_collection << Beer.new(beer_hash)
    end
    beers_collection
  end

  def self.find(beer_id)
    Beer.new(Unirest.get("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{ beer_id }.json").body)
  end

  def self.delete(beer_id)
    Beer.find(Unirest.delete("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{ beer_id }.json").body)
  end

end