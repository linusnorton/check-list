
# Dependencies
GitHubApi = require 'github'

# New GitHub client
github = new GitHubApi
    version: '3.0.0'

# Exports
module.exports = github
