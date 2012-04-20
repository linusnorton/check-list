class Accordion
	constructor: (@settings) ->
		@bindModules module for module in $(@settings.elements)

	bindModules: (module) ->
		$(module).find(@settings.switcher)
		.bind 'click', (event) =>
			@moduleClicked event		

	moduleClicked: (event) ->
		console.log $(event.target).data().state