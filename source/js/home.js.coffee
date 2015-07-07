class Home

  constructor: ->
    #console.log 'foo'
    @videoID = 72863556
    @appendVideo()

    #$(".arrow.left").click @debounce(@carouselRight, 1000, true)
    #$(".arrow.right").click @debounce(@carouselLeft, 1000, true)

  appendVideo: ->
    $("#video_player").append($("<iframe src='http://player.vimeo.com/video/#{@videoID}?title=0&byline=0&portrait=0' width='100%' height='auto' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"))

  carouselRight: ->
    list = $("#carousel_list li")
    first = $("#carousel_list li:first-child")
    last = $("#carousel_list li:last-child")
    left_last = ($(list).size() - 1) * $(list).width()
    $(list).animate {
    	left: '-=' + parseInt($(list).width())
    }, 1000, 'easeInSine',  ->

      if $(this).prop("id") == last.prop("id")
        $(first).css('left', left_last)
        $("#carousel_list").append($(first))

  carouselLeft: ->
    list = $("#carousel_list li")
    first = $("#carousel_list li:first-child")
    last = $("#carousel_list li:last-child")
    left_first = $(first).width()
    $("#carousel_list").prepend($(last))
    $(last).css('left', -left_first)
    $(list).animate {
    	left: '+=' + parseInt($(first).width())
    }, 1000, 'easeInSine'

  debounce: (func, threshold, execAsap) ->
    timeout = null
    (args...) ->
      obj = this
      delayed = ->
        func.apply(obj, args) unless execAsap
        timeout = null
      if timeout
        clearTimeout(timeout)
      else if (execAsap)
        func.apply(obj, args)
      timeout = setTimeout delayed, threshold || 100
    
home = new Home()
