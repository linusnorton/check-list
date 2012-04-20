
# 'Static' page controller
module.exports =

    # Home action
    #
    # Serves the application home page
    home: (request, response) ->
        response.render 'home',
            title: 'Welcome!'
            user: request.session.user
