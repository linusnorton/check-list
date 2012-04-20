
List = require "../models/List"
Module = require "../models/Module"

# List controller
module.exports = (request, response) ->

    # No ID, create a new list
    if !request.params.id
        
        # Get Modules (nested callbacks FTW!)
        Module.find {}, (error, modules) ->
            throw error if error

            # Create a new list
            list = new List
                user: request.session.user.id
                name: 'New List'
                modules: {}

            for module in modules
                listModule =
                    active: false
                    items: {}
                for item in module.items
                    listModule.items[item._id] = false
                list.modules[module._id] = listModule

            # Save and redirect
            list.save (error) ->
                throw error if error
                console.log list
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

                    # Modules for the fucking view... *vomit*
                    viewModules = []
                    for module in modules
                        viewModule =
                            _id: module._id
                            name: module.name
                            active: list.modules[module._id]?.active
                            items: []
                        for item in module.items
                            viewModule.items.push(
                                title: item.title
                                description: item.description
                                status: list.modules[module._id]?.items[item._id]?.status
                            )
                        viewModules.push viewModule

                    # Render view
                    response.render 'list',
                        title: list.name
                        user: request.session.user
                        list: list
                        modules: viewModules

        