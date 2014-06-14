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
    @loadInitialContent()

  getIdFromClick: (e)->
    return $(e.currentTarget).data("id")

  showScreeningDetail: (id)->
    $("#screening-overview-wrapper").hide()
    $(".screening-detail[data-id=#{id}]").fadeIn()

  showScreeningOverview: ->
    $(".screening-detail").hide()
    $("#screening-overview-wrapper").fadeIn()

  # get the params from the url, and if a valid id is present, load that page
  loadInitialContent: ->
    params = @getParams()

    if params.id? && @isValidId(params.id)
      @showScreeningDetail(params.id)
    else
      @showScreeningOverview()

  getParams: ->
    res = {}
    params = window.location.search.replace(/^\?/, "")

    for param in params.split("&")
      param = param.split("=")
      res[param[0]] = param[1]

    return res

  isValidId: (id)->
    return _.contains(_.keys(screeningData), id)
}
