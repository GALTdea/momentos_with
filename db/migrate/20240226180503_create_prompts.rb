class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.text :question
      t.text :description

      t.timestamps
    end
  end
end
