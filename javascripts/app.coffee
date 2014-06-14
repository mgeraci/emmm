$ ->
	emmm.init()

emmm = {

	init: ->
		console.log 'init function'

		# get markup for event and detail templates
		@eventTemplateMarkup = $("#event-template").html().replace(/[\t\n\r]/g, '')

		@addEvents()

	addEvents: ->
		@parseEventData()

		for event in @events
			$("#events").append(@eventTemplate(event))

	# create a structure for event overviews from the data
	parseEventData: ->
		@events = [{
			movie: 'asffsd'
			waffle: 'asoorea'
			drink: 'sdofowjew wjeof'
		}, {
			movie: 'bior iro'
			waffle: 'aadskj ofpewj'
			drink: 'aokoe keow'
		}]

	eventTemplate: (data)->
		_.template(@eventTemplateMarkup, data)
}
