class AddTestRefToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :test, foreign_key: true
  end
end
