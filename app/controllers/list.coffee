
List = require "../models/List"
Module = require "../models/Module"

# List controller
module.exports = (request, response) ->

    # No ID, create a new list
    if !request.params.id
        
        # Create a new list
        list = new List
            user: request.session.user.id
            name: 'New List'

        # Save and redirect
        list.save (error) ->
            throw error if error
            response.redirect '/list/' + list._id

    # Render the list
    else

        # Get list
        List.findOne {_id: request.params.id, user: request.session.user.id}, (error, list) ->
            
            # Error: not a list, redirect
            if error || !list
                response.redirect '/'

            # We have a list!
            else
                
                # Get Modules (nested callbacks FTW!)
                Module.find {}, (error, modules) ->
                    throw error if error
                    
                    # Render view
                    response.render 'list',
                        title: list.name
                        user: request.session.user
                        list: list
                        modules: modules

        