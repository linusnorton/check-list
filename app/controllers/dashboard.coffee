
List = require "../models/List"

# Dashboard controller
module.exports = (request, response) ->

    # User authenticated
    if request.session.user

        # Get lists
        lists = List.find {user: request.session.user.id}

        # Render view
        response.render 'dashboard',
            title: 'Welcome!'
            user: request.session.user

    # No user
    else
        response.render 'login',
            title: 'Welcome!'
            user: request.session.user
            lists: lists