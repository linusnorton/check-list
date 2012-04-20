
List = require "../models/List"

# Dashboard controller
module.exports = (request, response) ->

    # User authenticated
    if request.session.user

        # Get lists
        List.find {user: request.session.user.id}, (error, docs) ->
            throw error if error

            # Render view
            response.render 'dashboard',
                title: 'Welcome!'
                user: request.session.user
                lists: docs

    # No user
    else
        response.render 'login',
            title: 'Welcome!'
            user: request.session.user