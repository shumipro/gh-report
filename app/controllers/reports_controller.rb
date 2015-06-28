class ReportsController < ApplicationController
  def index
    reports = GithubService.reports(current_user)
    @markdown = MarkdownRenderer.render(reports)
  end
end
