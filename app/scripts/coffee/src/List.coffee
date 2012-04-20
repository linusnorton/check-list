class List
	constructor: (@settings) ->
		@bindModule module for module in $(@settings.elements)
		@listId = $(@settings.listIdentifier).val()

	bindModule: (module) ->
		$(module).find(@settings.switcher)
		.bind 'click', (event) =>
			@moduleClicked event

		@bindItems item for item in $(module).next(@settings.listContainer).find('li')

	bindItems: (item) ->
		$(item).find(@settings.checker)
		.bind 'click', (event) =>
			@itemClicked event, $(item).data('item-id')

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

	itemClicked: (event, itemId) ->
		checker = $(event.target)
		state = checker.data('state')
		console.log itemId

		if state is true
			console.log 'checked'
			@uncheckItem 
		else if state is false
			console.log 'unchecked'
			@checkItem
		else
			console.log 'na'
			@uncheckItem

