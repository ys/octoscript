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

issues = client.list_issues(repo, state: :open).select{ |issue| issue.title =~ /#{search_term}/ }
