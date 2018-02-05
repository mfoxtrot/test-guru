class GistQuestionService

  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @client = Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call(params)
    response = @client.create_gist(params)
  end
end
