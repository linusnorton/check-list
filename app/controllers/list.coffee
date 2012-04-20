
# List controller
module.exports = (request, response) ->

    # No ID, redirect home
    if !request.params.id
        response.redirect '/'

    # Render the list
    else
        response.render 'list',
            title: 'Welcome!'
            user: request.session.user
        