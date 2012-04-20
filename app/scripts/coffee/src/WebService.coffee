class WebService
	constructor: () ->

	sendRequest: (data) ->
		$.ajax data

	
	updateModule: (listId, moduleId, state, successCallback) ->
		@sendRequest {
			url: '/module'
			data: {
				listId: listId
				moduleId: moduleId
				state: state
			}
			type: 'POST'
			success: successCallback
			
		}
