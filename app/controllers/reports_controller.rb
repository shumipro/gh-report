class ReportsController < ApplicationController
  def index
    events = if params[:range] == 'week'
      events = GithubService.weekly_events(current_user)
    else
      events = GithubService.daily_events(current_user)
    end

    reports = Report.new(events).markdown
    @markdown = MarkdownRenderer.render(reports)
  end
end
