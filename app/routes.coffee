
# Routes
module.exports = ->

    # Load middleware
    authMiddleware = require('./middleware/auth')

    # 'Static page' routes
    @get '/', authMiddleware, require('./controllers/static').home
    @get '/list', authMiddleware, require('./controllers/static').list

    # Auth routes
    @all '/auth', require('./controllers/auth')
    @all '/auth/:step', require('./controllers/auth')
