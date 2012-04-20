
mongoose = require 'mongoose'

List = require "../models/List"
Module = require "../models/Module"

class TestController 
    constructor: (@request, @response) ->
  
    # Create a test module
    insertModule: =>        
        item = 
            title: "Check yo' self fool"
            description: "Grap hold of croch and check equipment status"

        module = new Module()
        module.name = "Self Checking List"
        module.items.push item
        module.save (err) =>
            if err?
                @response.send { success: false }
            else
                this.insertList(module)

    # Insert a user list
    insertList: (module) =>
        listItem =
            _item: module.items[0]._id
            status: true;

        listModule =
            _module: module._id
            items: [listItem]

        list = new List()
        list.user = "Billy McGee"
        list.name = "Yo mumma"
        list.modules.push(listModule) 

        list.save (err) =>
            if err?
                @response.send { success: false }
            else
                @response.send { success: true }

    # /test/data 
    #
    # Inserts the test data
    data: =>
        this.insertModule()


# List controller
module.exports.data = (request, response) ->
  controller = new TestController request, response
  controller.data()