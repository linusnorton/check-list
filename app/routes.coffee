
# Routes
module.exports = ->

    # Load middleware
    authMiddleware = require('./middleware/auth')
    requireAuthMiddleware = require('./middleware/requireAuth')

    # Dashboard routes
    @get '/', authMiddleware, require('./controllers/dashboard')
    @get '/list', authMiddleware, requireAuthMiddleware, require('./controllers/list')
    @get '/list/:id', authMiddleware, requireAuthMiddleware, require('./controllers/list')

    # Auth routes
    @all '/auth', require('./controllers/auth')
    @all '/auth/:step', require('./controllers/auth')

    # Fucking awesome test data, bitch
    @get '/test/data', require('./controllers/test').data

