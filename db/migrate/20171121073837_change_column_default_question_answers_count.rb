class ChangeColumnDefaultQuestionAnswersCount < ActiveRecord::Migration[5.1]
  def change
    change_column_default :questions, :answers_count, 0
  end
end
