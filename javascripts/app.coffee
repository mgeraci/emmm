$ ->
	emmm.init()

emmm = {

	init: ->
		# get markup for event and detail templates
		@eventTemplateMarkup = $("#event-template").html().replace(/[\t\n\r]/g, '')

		@addEvents()

	addEvents: ->
		@parseEventData()

		for event in @events
			$("#events").append(@eventTemplate(event))

	# create a structure for event overviews from the data
	parseEventData: ->
		@events = []

		for event of events
			event = events[event]

			@events.push({
				movie: event.movie.title
				waffle: event.waffle.base
				drink: event.drink.base || event.drink.name
			})

	eventTemplate: (data)->
		_.template(@eventTemplateMarkup, data)
}
