class Beer
  HEADERS = { "Accept" => "application/json",
              "X-User-Email" => ENV[ "API_EMAIL" ],
              "Authorization" => "Token token=#{ ENV[ "API_TOKEN" ]}"
                            }
  attr_accessor :id, :name, :style, :ibu, :alcohol

  def initialize(hash={})
    @id = hash["id"]
    @name = hash["name"]
    @style = hash["style"]
    @ibu = hash["ibu"]
    @alcohol = hash["alcohol"]
  end

  def self.all
    beers_collection = []
    api_beers = Unirest.get("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers.json",
                            headers: HEADERS
                            ).body
    api_beers.each do |beer_hash|
      beers_collection << Beer.new(beer_hash)
    end
    beers_collection
  end

  def self.find(beer_id)
    Beer.new(Unirest.get("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{ beer_id }.json",
                        headers: HEADERS
                        ).body)
  end

  def delete
    Unirest.delete("#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{ id }.json",
                    headers: HEADERS
                    ).body
  end

  def self.create(beer_info)
    beer = Unirest.post( "#{ ENV[ "API_HOST_URL" ]}/api/v2/beers",
                          headers: HEADERS,
                          parameters: beer_info
                          ).body
    Beer.new(beer)
  end

  def update(beer_info)
    beer = Unirest.patch(
                          "#{ ENV[ "API_HOST_URL" ]}/api/v2/beers/#{ id }.json",
                          headers: HEADERS,
                          parameters: beer_info
                          ).body
    Beer.new(beer)
  end

end
