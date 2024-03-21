class RemoveNullFalceFromQuiz < ActiveRecord::Migration[7.1]
  def change
    change_column_null :quiz_sessions, :child_id, true
  end
end
