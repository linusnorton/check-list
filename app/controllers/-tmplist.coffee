List = require "../models/List"
ListModule = require "../models/ListModule"
ListItems = require "../models/ListItems"
Item = require "../models/Item"
Module = require "../models/Module"

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
        item = new Item
        item.name = "Check yo' self fool"
        item.description = "Grap hold of croch and check equipment status"

        module = new Module
        module.name = "Self Checking List"
        module.items.push item

        module.save()

        list = new List
        list.name = "Yo mumma"
        list.modules.push 

        list.save (err) ->
            if err?
                response.send { success: false }
            else
                response.send { success: true }
