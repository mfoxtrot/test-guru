class Test < ApplicationRecord
  belongs_to :category

  def self.tests_titles_by_category(category_title)
    category_id = Category.find_by(title: category_title)
    Test.joins(:category).where(categories: {id: category_id}).select(:title).order("tests.title desc")
  end
end
