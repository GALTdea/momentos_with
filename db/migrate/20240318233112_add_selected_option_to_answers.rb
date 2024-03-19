class AddSelectedOptionToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :selected_option, :string, null: false
  end
end
