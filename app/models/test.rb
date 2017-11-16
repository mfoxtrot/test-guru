class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.tests_titles_by_category(category_title)
    #category_id = Category.find_by(title: category_title)
    Test.joins(:category).where(categories: {id: Category.find_by(title: category_title)}).order("tests.title desc").pluck(:title)
  end
end
