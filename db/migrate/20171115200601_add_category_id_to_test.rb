class AddCategoryIdToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :category_id, :integer
  end
end
