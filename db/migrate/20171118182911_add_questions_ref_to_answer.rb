class AddQuestionsRefToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, foreign_key: true
  end
end
