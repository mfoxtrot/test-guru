class Badge < ApplicationRecord

  BADGE_METHODS_AND_NAMES = [
    'all_tests_at_category',
    'passing_test_at_first_attempt',
    'all_tests_at_level'
  ]

  validates :name, presence: true
  validates :rule_name, presence: true
  validates :rule_parameter, presence: true
  validates :badge_image, presence: true

  def self.rules
    BADGE_METHODS_AND_NAMES
  end

end
