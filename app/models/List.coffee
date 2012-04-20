
# Dependencies
mongoose = require 'mongoose'
ListModule = require './ListModule'

Schema = mongoose.Schema

# List Schema
ListSchema = new Schema
    
    # User (GitHub ID)
    user:
        type: String
        required: true    

    # List name
    name:
        type: String
        required: true
        validate: (value) ->
            (value.length > 0 && value.length < 60)
        set: (value) ->
            value.trim()

    # Dates
    date:
        created:
            type: Date,
            required: true,
            default: Date.now

    # List modules, contain the Module state
    modules: {}

, {strict: true}

# List Model
ListModel = mongoose.model 'List', ListSchema;

# Exports
module.exports = ListModel
