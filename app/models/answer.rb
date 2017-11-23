class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :question_exceeded_answers_limit

  def question_exceeded_answers_limit
    errors.add(:question, "Exceeded answers limit") if question.answers_count >= ANSWERS_LIMIT_PER_QUESTION
  end
end
