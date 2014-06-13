$ ->
	emmm.init()

emmm = {

	init: ->
		console.log 'init function'

		# get markup for event and detail templates
		@eventTemplateMarkup = $("#event-template").html().replace(/[\t\n\r]/g, '')

		@addEvents()

	addEvents: ->
		events = [{
			movie: 'asffsd'
			waffle: 'asoorea'
			drink: 'sdofowjew wjeof'
		}, {
			movie: 'bior iro'
			waffle: 'aadskj ofpewj'
			drink: 'aokoe keow '
		}]

		for event in events
			$("#events").append(@eventTemplate(event))

	eventTemplate: (data)->
		_.template(@eventTemplateMarkup, data)
}
