class PokemonsController < ApplicationController
  require 'rest-client'

  def index
    response = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
    data = JSON.parse(response.body)
    create_from_api(data)
    @pokemons = Pokemon.all
  end

 private

  def create_from_api(pokemon_data)
    pokemon_data["results"].each do |pokemon|
      unless Pokemon.find_by(name: pokemon["name"])
        Pokemon.create(name: pokemon["name"])
      end
    end
  end
end
