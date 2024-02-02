class CreateChefs < ActiveRecord::Migration[7.1]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :region

      t.timestamps
    end
  end
end
