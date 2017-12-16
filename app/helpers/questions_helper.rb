module QuestionsHelper
  def question_header(question)
    action_title = question.new_record? ? "Create new" : "Edit"
    action_title << " #{question.test.title} Question"
  end
end
