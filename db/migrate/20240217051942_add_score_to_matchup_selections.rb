class AddScoreToMatchupSelections < ActiveRecord::Migration[7.1]
  def change
    add_column :matchup_selections, :score, :float
  end
end
