class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many :tests_user
  has_many :users, through: :tests_users
  has_many :questions

  def self.tests_titles_by_category(category_title)
    Test.joins(:category).where(categories: {title: category_title}).order("tests.title desc").pluck(:title)
  end
end
