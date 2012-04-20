
# Dashboard controller
module.exports = (request, response) ->

    # User authenticated
    if request.session.user
        response.render 'dashboard',
            title: 'Welcome!'
            user: request.session.user

    # No user
    else
        response.render 'login',
            title: 'Welcome!'
            user: request.session.user