
mongoose = require 'mongoose'

List = require "../models/List"

class TestController 
    constructor: (@request, @response) ->
  
    # /item (POST) 
    #
    # Update an items status in a list
    #
    # @param integer listId
    # @param integer itemId
    # @param boolean status
    #
    update: =>
        listId = @request.param 'listId'
        moduleId = @request.param 'moduleId'
        status = @request.param 'status', true

        @response.send
            success: true

        # List.findById listId, (err, doc) =>
        #     console.log doc



# List controller
module.exports.update = (request, response) ->
  controller = new TestController request, response
  controller.update()