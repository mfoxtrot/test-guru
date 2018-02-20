class ChangeDatetimeColumnsInTestPassage < ActiveRecord::Migration[5.1]
  def change
    change_column :test_passages, :start_time, :datetime
    change_column :test_passages, :end_time, :datetime
  end
end
