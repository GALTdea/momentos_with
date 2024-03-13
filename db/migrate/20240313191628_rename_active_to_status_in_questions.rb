class RenameActiveToStatusInQuestions < ActiveRecord::Migration[7.1]
  def change
    rename_column :questions, :active, :status
    change_column_default :questions, :status, from: nil, to: "inactive"
  end
end
