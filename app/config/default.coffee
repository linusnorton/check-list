
# Dependencies
express = require 'express'
hulk = require 'hulk-hogan'
mongoose = require 'mongoose'

# Application default configuration
#
# This is loaded before either of the
# environment-specific configurations.
module.exports = ->
    baseDir = @set 'baseDir'

    # The port the application should run on
    @set 'port', 3000

    # Register hulk-hogan (mustache) views
    @register '.html', hulk

    # Set the view directory and default options
    @set 'views', baseDir + '/app/views'
    @set 'view engine', 'html'
    @set 'view options',
        layout: 'layouts/default'
        title: 'Untitled Page'

    # Set the app's public directory
    @use express.static(baseDir + '/public')
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()

    # Enable cookies
    @use express.cookieParser()

    # Enable Sessions
    @use express.session({ secret: "Nyan Cat" })
    
    # Mount application routes
    @use @router

    # Connect to Mongo via Mongoose
    mongoose.connect 'mongodb://localhost/checklist'
