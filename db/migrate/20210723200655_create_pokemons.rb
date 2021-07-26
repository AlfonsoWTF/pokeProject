class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :description
      t.string :types
      t.string :image_url

      t.timestamps
    end
  end
end
