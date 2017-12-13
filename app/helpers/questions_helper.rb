module QuestionsHelper
  def question_header(persisted_question, test_id)
    action_title = persisted_question ? "Edit" : "Create new"
    action_title << " #{Test.find(test_id).title} Question"
  end
end
