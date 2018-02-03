module ApplicationHelper
  def current_year
    DateTime.current.year.to_s
  end

  def github_link(user_name, repo_name)
    tag.a repo_name, href: "https://github.com/#{user_name}/#{repo_name}", target: '_blank'
  end

  def bootstrap_class_for(flash_type)
    {
      alert: "alert alert-danger",
      notice: "alert alert-info"
    }[flash_type.to_sym]||""
  end
end
