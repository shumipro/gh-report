class Report
  def initialize(events)
    @events = events
  end

  def markdown
    url_to_detail = {}

    @events.each do |_|
      case _.type
      when "IssuesEvent"
        url_to_detail[_.payload.issue.html_url] ||= {title: _.payload.issue.title, comments: []}
      when "IssueCommentEvent"
        url_to_detail[_.payload.issue.html_url] ||= {title: _.payload.issue.title, comments: []}
        url_to_detail[_.payload.issue.html_url][:comments] << _.payload.comment.html_url
      when "PullRequestEvent"
        url_to_detail[_.payload.pull_request.html_url] ||= {title: _.payload.pull_request.title, comments: []}
      when "PullRequestReviewCommentEvent"
        url_to_detail[_.payload.pull_request.html_url] ||= {title: _.payload.pull_request.title, comments: []}
        url_to_detail[_.payload.pull_request.html_url][:comments] << _.payload.comment.html_url
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
