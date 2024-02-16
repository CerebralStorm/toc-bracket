class CreateBrackets < ActiveRecord::Migration[7.1]
  def change
    create_table :brackets do |t|
      t.integer :user_id
      t.integer :league_id
      t.integer :template_bracket_id

      t.timestamps
    end
  end
end
