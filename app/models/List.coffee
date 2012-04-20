
# Dependencies
mongoose = require 'mongoose'
Schema = mongoose.Schema

# List Schema
ListSchema = new Schema
    
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

, {strict: true}

# List Model
ListModel = mongoose.model 'List', ListSchema;

# Exports
module.exports = ListModel
