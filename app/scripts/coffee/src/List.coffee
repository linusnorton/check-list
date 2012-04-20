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

		@bindNa $(item).find(@settings.disableSelector)

	bindNa: (selector) ->
		$(selector).bind 'click', (event) =>
			@naClicked event

	naClicked: (event) ->
		element = $(event.target)
		currClass = element.closest('li').attr('class')
		checker = element.parent().find(@settings.checker)
		itemId =  element.closest('li').data('item-id')

		if currClass is @settings.disabledClass
			element.closest('li').removeClass(@settings.disabledClass)
			checker.removeClass('na')
			checker.data('state', false)
		else
			element.closest('li').addClass(@settings.disabledClass)
			checker.removeClass(@settings.checkedClass)
			checker.addClass('na')
			checker.data('state', 'na')

		@settings.ws.updateItem(@listId, itemId, checker.data('state'))

	moduleClicked: (event) ->
		console.log $(event.target).data('state')
		switcher = $(event.target)

		if switcher.data('state') is 'on'
			@hideModule switcher
		else
			@showModule switcher

		@settings.ws.updateModule(@listId, switcher.data('module-id'), switcher.data('state'))

	hideModule: (switcher) ->
		switcher.parent().next(@settings.listContainer).slideUp =>
			switcher.parent().next(@settings.listContainer).removeClass(@settings.activeClass)
			switcher.data('state', 'off')
			switcher.removeClass('on')
			switcher.addClass('off')
			switcher.html('OFF')

	showModule: (switcher) ->
		switcher.parent().next(@settings.listContainer).slideDown =>
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
			@uncheckItem checker
		else if state is false
			@checkItem checker
		else
			console.log 'na'

		@settings.ws.updateItem(@listId, itemId, checker.data('state'))

	uncheckItem: (checker)->
		checker.removeClass(@settings.checkedClass)
		checker.data('state', false)
		checker.html('Not Checked')

	checkItem: (checker)->
		checker.addClass(@settings.checkedClass)
		checker.data('state', true)
		checker.html('Checked')


