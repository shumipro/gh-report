class GithubService
  def self.events(user, range:)
    client = Octokit::Client.new(login: user.nickname, access_token: user.token)
    events = client.user_events(user.nickname, page: 1)
    events.select { |e| range.first < e[:created_at] && e[:created_at] < range.last }
  end

  def self.today_events(user)
    self.events(user, range: Date.today.beginning_of_day..Date.today.end_of_day)
  end
end
