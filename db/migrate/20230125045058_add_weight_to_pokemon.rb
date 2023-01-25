class AddWeightToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :weight, :integer
  end
end
