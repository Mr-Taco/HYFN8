
class noOldBrowsers

  constructor: ->
    window.location.href = "/browse_happy" if window.location.href.lastIndexOf("browse_happy") == -1


new noOldBrowsers()