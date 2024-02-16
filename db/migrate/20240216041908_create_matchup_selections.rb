class CreateMatchupSelections < ActiveRecord::Migration[7.1]
  def change
    create_table :matchup_selections do |t|
      t.integer :user_id
      t.integer :bracket_id
      t.integer :matchup_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
