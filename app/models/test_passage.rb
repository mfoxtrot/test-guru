class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question, on: [:create, :update]

  MINIMUM_PERCENT_OF_PASSAGE = 0.85

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def passed?
    correct_question_percent = self.correct_questions / test.questions.count
    true if correct_question_percent >= MINIMUM_PERCENT_OF_PASSAGE
  end

  def current_question_index
    test.questions.index(current_question) + 1 if !completed?
  end

  def number_of_questions
    test.questions.size
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answers_ids).count) &&
    (correct_answers_count == answers_ids.count)
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0: current_question.id).first
  end
end