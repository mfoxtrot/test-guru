require 'digest/sha1'

class User < ApplicationRecord
  #Taken from Devise.email_regexp
  EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: "Test", foreign_key: "user_id"

  has_secure_password

  validates :email, uniqueness: true
  validate :email_correct

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def email_correct
    errors.add(:email, "doesn't seem to be correct") unless email =~ EMAIL_REGEXP
  end
end
