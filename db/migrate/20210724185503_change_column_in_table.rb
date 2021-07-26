class ChangeColumnInTable < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemon_stats, :attack, :integer
  end
end
