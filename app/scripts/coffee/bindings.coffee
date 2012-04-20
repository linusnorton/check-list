$ ->
	ws = new WebService

	list = new List {
		listIdentifier: "input[name='list-id']"
		listContainer: ".list-options"
		elements: "div.module"
		switcher: ".switcher"
		checker: ".checkbox"
		activeClass: "active"
		checkedClass: "checked"
		ws: ws
	}