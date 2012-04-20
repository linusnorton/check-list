
# Dependencies
mongoose = require 'mongoose'
Item = require './Item'
Schema = mongoose.Schema

# Module Schema
ModuleSchema = new Schema
    
    # Module name
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

    # List items
    items: [Item]

, {strict: true}

# Module Model
ModuleModel = mongoose.model 'Module', ModuleSchema;

# Exports
module.exports = ModuleModel
