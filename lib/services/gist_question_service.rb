class GistQuestionService

  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(test_passage)
    @test_passage = test_passage
    @client = Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call
    params = params_for_gist
    response = @client.create_gist(params)
  end

  private

  def params_for_gist
      question = @test_passage.current_question
      content = ["#{I18n.translate('lib.services.gist_question_service.question_body')}: #{question.body}"]
      content << "#{I18n.translate('lib.services.gist_question_service..answers')}:"
      content << question.answers.pluck(:body)
      {description: '', public: true, files: {"'question_#{question.id}''": {content: content.join("\n")}}}
  end
end
