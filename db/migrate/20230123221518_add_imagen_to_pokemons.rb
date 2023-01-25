class AddImagenToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :imagen, :string
  end
end
