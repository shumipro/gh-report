class GithubService
  def self.get_events(user)
    client = Octokit::Client.new(login: user.nickname, access_token: user.token)
    client.user_events(user.nickname, page: 1)
  end
end
