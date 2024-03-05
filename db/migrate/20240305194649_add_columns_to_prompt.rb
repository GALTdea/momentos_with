class AddColumnsToPrompt < ActiveRecord::Migration[7.1]
  def change
    add_column :prompts, :category, :string
    add_column :prompts, :type, :string
  end
end
