
# Dependencies
mongoose = require 'mongoose'
Schema = mongoose.Schema

# List Items Schema
ListItemSchema = new Schema
    
    # Item it relates to
	_item: Schema.ObjectId

	# Status
	status:
		type: Boolean
		required: true
		default: true

, {strict: true}

# Exports
module.exports = ListItemSchema
