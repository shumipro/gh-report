class ReportsController < ApplicationController
  def index
    reports = Report.new(GithubService.today_events(current_user)).markdown
    @markdown = MarkdownRenderer.render(reports)
  end
end
