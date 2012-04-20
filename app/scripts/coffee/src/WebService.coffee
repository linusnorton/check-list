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

	updateItem: (listId, itemId, state, successCallback) ->
		@sendRequest {
			url: '/item'
			data: {
				listId: listId
				itemId: itemId
				state: state
			}
			type: 'POST'
			success: successCallback
			
		}
