module ApplicationHelper
  def current_year
    DateTime.now.year.to_s
  end

  def github_url(user_name, repo_name)
    "https://github.com/#{user_name}/#{repo_name}"
  end
end
