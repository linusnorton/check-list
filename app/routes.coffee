
# Routes
module.exports = ->

    # 'Static page' routes
    @get '/', require('./controllers/static').home
    @get '/list', require('./controllers/list').index
    @get '/list/put', require('./controllers/list').put