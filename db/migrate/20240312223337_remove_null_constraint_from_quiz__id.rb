class RemoveNullConstraintFromQuizId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :questions, :quiz_id, true

  end
end
