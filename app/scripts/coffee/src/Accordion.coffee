class Accordion
	constructor: (@settings) ->
		@bindModules module for module in $(@settings.elements)
		@listId = $(@settings.listIdentifier).val()

	bindModules: (module) ->
		$(module).find(@settings.switcher)
		.bind 'click', (event) =>
			@moduleClicked event		

	moduleClicked: (event) ->
		console.log $(event.target).data('state')
		switcher = $(event.target)

		if switcher.data('state') is 'on'
			@hideModule switcher
			@settings.ws.updateModule(@listId, switcher.data('module-id'), switcher.data('state'))
		else
			@showModule switcher
			@settings.ws.updateModule(@listId, switcher.data('module-id'), switcher.data('state'))

	hideModule: (switcher) ->
		switcher.parent().next(@settings.listContainer).removeClass(@settings.activeClass)
		switcher.data('state', 'off')
		switcher.removeClass('on')
		switcher.addClass('off')
		switcher.html('OFF')

	showModule: (switcher) ->
		switcher.parent().next(@settings.listContainer).addClass(@settings.activeClass)
		switcher.data('state', 'on')
		switcher.removeClass('off')
		switcher.addClass('on')
		switcher.html('ON')
