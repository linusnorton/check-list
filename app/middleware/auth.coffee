
# Dependencies
github = require '../library/githubApi'

# Auth middleware - makes sure the user is logged in
module.exports = (request, response, next) ->
    if request.session.githubAccessToken

        # Authenticate
        github.authenticate
            type: 'oauth',
            token: request.session.githubAccessToken

        # We need a user, make sure we have one
        if !request.session.user

            github.user.get {}, (error, user) ->
                throw error if error
                request.session.user = user
                next()

        # ...already have a user, Continue with routing
        else
            next()

    else
        # ...no token, continue with routing
        next()
