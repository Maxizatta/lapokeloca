class PokemonsController < ApplicationController
  require 'rest-client'
  require 'kaminari'

  def index
    session[:page_number] = params[:page] || 1
    response = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
    data = JSON.parse(response.body)
    create_from_api(data)
    @pokemons = Pokemon.all.page(params[:page] || 1).per(6)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    session[:page_number] ||= 1
  end

  private

  def create_from_api(pokemon_data)
    pokemon_data["results"].each do |pokemon|
      if Pokemon.find_by(name: pokemon["name"]).nil?
        response = RestClient.get(pokemon["url"])
        data = JSON.parse(response.body)
        image = data["sprites"]["back_default"]
        weight = data["weight"]
        Pokemon.create(name: pokemon["name"], url: pokemon["url"], imagen: image, weight: weight)
      end
    end
  end
end
