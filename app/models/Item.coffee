
# Dependencies
mongoose = require 'mongoose'
Schema = mongoose.Schema

# Item Schema
ItemSchema = new Schema

	# Title 
    title:
        type: String
        required: true
        validate: (value) ->
            (value.length > 0 && value.length < 60)
        set: (value) ->
            value.trim()

	# Description
    description:
        type: String
        required: true
        validate: (value) ->
            (value.length > 0 && value.length < 60)
        set: (value) ->
            value.trim()



, {strict: true}

# Exports
module.exports = ItemSchema
