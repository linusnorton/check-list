
# Routes
module.exports = ->

    # 'Static page' routes
    @get '/', require('./controllers/static').home
    @get '/list', require('./controllers/static').list