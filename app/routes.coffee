
# Routes
module.exports = ->

    # Load middleware
    authMiddleware = require('./middleware/auth')

    # 'Static page' routes
    @get '/', authMiddleware, require('./controllers/static').home

    #@get '/list', authMiddleware, require('./controllers/list').index
    @get '/list', authMiddleware, require('./controllers/static').examplelist
    @get '/list/put', authMiddleware, require('./controllers/list').put

    # Auth routes
    @all '/auth', require('./controllers/auth')
    @all '/auth/:step', require('./controllers/auth')
