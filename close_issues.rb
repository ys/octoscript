require 'octokit'

puts 'repo'
repo = gets
puts 'search term for issues'
search_term = gets
puts 'username'
username = gets
puts 'password'
password = gets

client = Octokit::Client.new(:login => username, :password => password)

do
  issues = client.list_issues(repo, state: :open).reject{ |issue| !(issue.title =~ /#{search_term}/) }
  issues.each do |issue|
    client.close_issue(repo, issue.number)
  end
while issues.any?
