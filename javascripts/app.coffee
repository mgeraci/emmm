$ ->
  data.initialize()
  navigation.initialize()

window.data = {
  initialize: ->
    # get markup for screening and detail templates
    @screeningOverviewTemplateMarkup = $("#screening-overview-template")
      .html().replace(/[\t\n\r]/g, '')
    @screeningDetailTemplateMarkup = $("#screening-detail-template")
      .html().replace(/[\t\n\r]/g, '')

    @addScreenings()

  addScreenings: ->
    @parseScreeningData()

    for screening in @screenings
      $("#screening-overview-wrapper")
        .append(@screeningOverviewTemplate(screening))
      $("#content")
        .append(@screeningDetailTemplate(screening))

  # create a structure for screening overviews from the data
  parseScreeningData: ->
    @screenings = []

    for screening of screeningData
      id = screening
      screening = screeningData[screening]
      screening.id = id
      screening.waffle.name = @getWaffleName(screening.waffle)
      screening.drink.name = @getDrinkName(screening.drink)

      @screenings.push({
        screening: screening
      })

  screeningOverviewTemplate: (screening)->
    return _.template(@screeningOverviewTemplateMarkup, screening)

  screeningDetailTemplate: (screening)->
    return _.template(@screeningDetailTemplateMarkup, screening)

  getWaffleName: (waffle)->
    return "#{waffle.base} waffles"

  getDrinkName: (drink)->
    if drink.name?
      return drink.name
    else
      return "#{drink.base} drinking vinegar"
}

window.navigation = {
  initialize: ->
    $(".screening-overview").on("click", @showScreeningDetail)

  showScreeningDetail: (e)->
    id = $(e.currentTarget).data("id")
    console.log(id)
    $("#screening-overview-wrapper").hide()
    $(".screening-detail[data-id=#{id}]").show()
}
