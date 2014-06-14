$ ->
  emmm.init()

window.emmm = {

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
      screening.waffle.name = @getWaffleName(screening.waffle)
      screening.drink.name = @getDrinkName(screening.drink)

      @screenings.push({
        screening: screening
      })

  screeningTemplate: (data)->
    return _.template(@screeningTemplateMarkup, data)

  getWaffleName: (waffle)->
    return "#{waffle.base} waffles"

  getDrinkName: (drink)->
    if drink.name?
      return drink.name
    else
      return "#{drink.base} drinking vinegar"
}
