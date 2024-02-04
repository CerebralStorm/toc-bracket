class CreateMatchups < ActiveRecord::Migration[7.1]
  def change
    create_table :matchups do |t|
      t.integer :bracket_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
