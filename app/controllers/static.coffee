
# 'Static' page controller
module.exports =

    # Home action
    #
    # Serves the application home page
    home: (request, response) ->
        response.render 'home',
            title: 'Welcome!'
            user: request.session.user

    # List page
    list: (request, response) ->
        response.render 'list',
            title: 'List'
            user: request.session.user
