class AddUrlToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :url, :string
  end
end

