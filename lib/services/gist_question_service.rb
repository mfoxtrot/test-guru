class GistQuestionService

  def initialize(test_passage)
    @test_passage = test_passage
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    response = @client.create_gist(params_for_gist)
  end

  private

  def params_for_gist
      question = @test_passage.current_question
      content = ["#{I18n.t('.question_body')}: #{question.body}"]
      content << "#{I18n.t('.answers')}:"
      content << question.answers.pluck(:body)
      {description: '', public: true, files: {"'question_#{question.id}''": {content: content.join("\n")}}}
  end
end
