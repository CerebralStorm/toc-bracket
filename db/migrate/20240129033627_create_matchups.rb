class CreateMatchups < ActiveRecord::Migration[7.1]
  def change
    create_table :matchups do |t|
      t.integer :template_bracket_id
      t.integer :winner_id
      t.integer :parent_id
      t.integer :round_number
      t.string :region

      t.timestamps
    end
  end
end
