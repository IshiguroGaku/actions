require "octokit"

client     = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
current_pr = client.pull_request(ENV["GITHUB_REPOSITORY"], ENV["CURRENT_PULL_REQUEST_NUMBER"])

res = client.update_pull_request(ENV["GITHUB_REPOSITORY"],
                             ENV["CURRENT_PULL_REQUEST_NUMBER"],
                             body: "#{current_pr.body}\n\nhoge")

p res
