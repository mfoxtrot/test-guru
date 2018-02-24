class Badge < ApplicationRecord

  validates :name, presence: true
  validates :rule_name, presence: true
  validates :rule_parameter, presence: true
  validates :badge_image, presence: true

  def self.rules
    [
      'All tests at the category',
      'Passing test at the first attempt',
      'All tests at the level'
    ]
  end
end
