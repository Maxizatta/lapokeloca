require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @pokemons" do
      pokemons = Pokemon.create!(name: "Pikachu")
      get :index
      expect(assigns(:pokemons)).to include(pokemons)

    end
  end

  describe "GET #show" do
    it "returns http success" do
      pokemon = Pokemon.create!(name: "Pikachu")
      get :show, params: { id: pokemon.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns @pokemon" do
      pokemon = Pokemon.create!(name: "Pikachu")
      get :show, params: { id: pokemon.id }
      expect(assigns(:pokemon)).to eq(pokemon)
    end
  end
end
