class AddScoreToMatchupSelections < ActiveRecord::Migration[7.1]
  def change
    add_column :matchup_selections, :score, :float, default: 0.0
  end
end
