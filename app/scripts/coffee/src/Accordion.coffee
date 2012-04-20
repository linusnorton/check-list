class Accordion
	constructor: (@settings) ->
		@bindElements()

	bindElements: () ->
		@bindClickEvents element for element in $(@settings.elements)

	bindClickEvents: (element) ->
		$(element).find(@settings.switcher)
		.bind 'click', (event) =>
			@moduleClicked event

	moduleClicked: (event) ->
		console.log $(event.target).data().state