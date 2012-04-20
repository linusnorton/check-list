
# Dependencies
url = require 'url'
querystring = require 'querystring'
OAuth2 = require('oauth').OAuth2
github = require '../library/githubApi'

# Auth controller
module.exports = (request, response) ->

    # Set up oAuth stuff - this should be somewhere else, but fuck it.
    clientId = '893f5eb02e917685d16e'
    secret = '372de72dfa51c82a1f5cabfbc1afd09bc612ddf8'
    oauth = new OAuth2 clientId, secret, 'https://github.com/', 'login/oauth/authorize', 'login/oauth/access_token'

    # Get the query-string
    requestUrl = url.parse request.url
    requestPath = requestUrl.pathname
    requestQuery = querystring.parse requestUrl.query

    # Get the current auth step
    authStep = request.params.step

    # Step 1: auth
    if !authStep
        console.log 'Auth Step 1'

        # No access token, initiate auth flow
        if !request.session.githubAccessToken
            authorizeUrl = oauth.getAuthorizeUrl
                redirect_uri: 'http://' + request.header('Host') + '/auth/callback'
                scope: 'user'
            console.log '  > No access token - redirect to ' + authorizeUrl
            response.redirect authorizeUrl, 303

        # Token! Get the user
        else
            console.log '  > token - get the user'
            github.user.get {}, (error, user) ->
                throw error if error
                response.json user # temporary
    
    # Step 2: callback
    else if authStep == 'callback'
        console.log 'Auth Step 2'

        # Updgrade the code to an access token
        oauth.getOAuthAccessToken requestQuery.code, {}, (error, responseAccessToken, responseRefreshToken) ->
            throw error if error
            console.log '  > upgrading token'

            # Store the access token
            request.session.githubAccessToken = responseAccessToken

            # redirect home, the API authenticates itself on page load
            response.redirect '/'

    # Step 2: signout
    else if authStep == 'signout'
        console.log 'Signout'

        # Trash the session
        delete request.session.githubAccessToken
        delete request.session.user
        response.redirect '/'

    # Invalid step - go home
    else
        response.redirect '/'

