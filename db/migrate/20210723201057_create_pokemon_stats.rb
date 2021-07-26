class CreatePokemonStats < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_stats do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed

      t.timestamps
    end
  end
end
