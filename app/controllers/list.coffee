List = require "../models/List"

# List controller
module.exports =

    # /list 
    #
    # Displays a list of lists available to the current user
    index: (request, response) ->
        List.find {}, (err, docs) ->
            if err?
                response.send { success: false }
            else
                response.send docs

    # /list/put
    #
    # Stores a list in the mongo document store
    put: (request, response) ->
        list = new List
        list.name = "Yo mumma"
        list.save (err) ->
            if err?
                response.send { success: false }
            else
                response.send { success: true }
