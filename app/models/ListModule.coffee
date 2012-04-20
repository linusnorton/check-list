
# Dependencies
mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

ListItem = require './ListItem'


# List Module Schema
ListModuleSchema = new Schema

    # Module ID
    _module: ObjectId
            
    # Active
    active:
        type: Boolean
        required: true
        default: true

    # List items for this module
    items: [ListItem]

, {strict: true}

# Exports
module.exports = ListModuleSchema
