class ChangeActiveToStatusInQuizzes < ActiveRecord::Migration[7.1]
  def change
    rename_column :quizzes, :active, :status
    change_column_default :quizzes, :status, 'draft'
  end
end
