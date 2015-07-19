class GithubService
  def self.events(user, range:, page: 1)
    client = Octokit::Client.new(login: user.nickname, access_token: user.token)
    events = client.user_events(user.nickname, page: page)
    selected_events = events.select { |e| range.first < e[:created_at] && e[:created_at] < range.last }

    if selected_events.size == events.size
      selected_events + self.events(user, range: range, page: (page + 1))
    else
      selected_events
    end
  end

  def self.daily_events(user)
    self.events(user, range: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def self.weekly_events(user)
    self.events(user, range: 1.week.ago.beginning_of_day..Date.today.end_of_day)
  end
end
