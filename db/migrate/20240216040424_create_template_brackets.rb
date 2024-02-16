class CreateTemplateBrackets < ActiveRecord::Migration[7.1]
  def change
    create_table :template_brackets do |t|
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
