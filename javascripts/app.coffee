$ ->
	emmm.init()

emmm = {

	init: ->
		# get markup for screening and detail templates
		@screeningTemplateMarkup = $("#screening-overview-template").html().replace(/[\t\n\r]/g, '')

		@addScreenings()

	addScreenings: ->
		@parseScreeningData()

		for screening in @screenings
			$("#screening-overview-wrapper").append(@screeningTemplate(screening))

	# create a structure for screening overviews from the data
	parseScreeningData: ->
		@screenings = []

		for screening of screeningData
			screening = screeningData[screening]

			if !screening.drink.name?
				screening.drink.name = "#{screening.drink.base} drinking vinegar"

			@screenings.push({
        screening: screening
			})

	screeningTemplate: (data)->
		_.template(@screeningTemplateMarkup, data)
}
