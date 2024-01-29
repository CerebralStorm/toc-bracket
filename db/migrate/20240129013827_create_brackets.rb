class CreateBrackets < ActiveRecord::Migration[7.1]
  def change
    create_table :brackets do |t|
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
