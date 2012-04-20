
# 'Require Auth' middleware - redirect home if the user isn't logged in
module.exports = (request, response, next) ->
    if !request.session.githubAccessToken
        response.redirect '/'
    else
        next()
