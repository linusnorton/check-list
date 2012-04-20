
# Dashboard controller
module.exports = (request, response) ->

    response.render 'dashboard',
        title: 'Welcome!'
        user: request.session.user
