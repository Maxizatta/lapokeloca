class AddAbilityToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :abilities, :text, array: true, default: []
  end
end
