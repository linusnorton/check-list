
# Routes
module.exports = ->

    # Load middleware
    authMiddleware = require('./middleware/auth')
    requireAuthMiddleware = require('./middleware/requireAuth')

    # 'Static page' routes
    @get '/', authMiddleware, require('./controllers/static').home

    #@get '/list', authMiddleware, require('./controllers/list').index
    @get '/list', authMiddleware, requireAuthMiddleware, require('./controllers/static').examplelist
    @get '/list/put', authMiddleware, requireAuthMiddleware, require('./controllers/list').put

    # Auth routes
    @all '/auth', require('./controllers/auth')
    @all '/auth/:step', require('./controllers/auth')
