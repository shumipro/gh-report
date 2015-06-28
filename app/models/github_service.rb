class GithubService
  def self.reports(user)
    client = Octokit::Client.new(login: user.nickname, access_token: user.token)
    events = client.user_events(user.nickname, page: 1)

    url_to_detail = {}

    events.each do |_|
      case _.type
      when "IssuesEvent"
        url_to_detail[_.payload.issue.html_url] ||= {title: _.payload.issue.title, comments: []}
      when "IssueCommentEvent"
        url_to_detail[_.payload.issue.html_url] ||= {title: _.payload.issue.title, comments: []}
        url_to_detail[_.payload.issue.html_url][:comments] << _.payload.comment.html_url
      when "PullRequestEvent"
        url_to_detail[_.payload.pull_request.html_url] ||= {title: _.payload.pull_request.title, comments: []}
      end
    end

    results = []
    url_to_detail.each do |url, detail|
      results.push "- #{detail[:title]} #{url}"
      detail[:comments].reverse.each do |comment|
        results.push "  * #{comment}"
      end
    end
    results.join("\n")
  end
end
