class AddStartTimeEndTimeToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :start_time, :date
    add_column :test_passages, :end_time, :date
  end
end
