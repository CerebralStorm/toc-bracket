class CreateMatchupChefs < ActiveRecord::Migration[7.1]
  def change
    create_table :matchup_chefs do |t|
      t.integer :matchup_id
      t.integer :chef_id

      t.timestamps
    end
  end
end
