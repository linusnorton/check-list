
List = require "../models/List"

# List controller
module.exports = (request, response) ->

    # No ID, create a new list
    if !request.params.id
        
        list = new List
            user: request.session.user.id
            name: 'New List'

        list.save (error) ->
            throw error if error
            response.redirect '/list/' + list._id

    # Render the list
    else
        response.render 'list',
            title: 'Welcome!'
            user: request.session.user
        