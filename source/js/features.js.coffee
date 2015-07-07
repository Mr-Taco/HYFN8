class Features

  constructor: ->
    $("#services_nav a").click (e) =>

      e.preventDefault()
      origin = $(e.currentTarget)

      $("#services_nav li.selected").removeClass("selected")
      origin.parent().addClass("selected")

      anchorName = origin.attr("href").replace("#", "")
      itemEl =  $("a[name='#{anchorName}']")
      if itemEl.length
        $("body, html").animate({
          'scrollTop':  itemEl.offset().top - 40
        }, 500)

      false


    # OPEN EACH SECTION
    $(".learn_more:even").click @moveLeft
    $(".learn_more:odd").click @moveRight

    $(".card_label").click @fadeToBack
    $(".back_card_label").click @fadeToFront
    $(".ads").click @fadeToFirst
    $(".apps").click @fadeToSecond
    $(".posts").click @fadeToThird

    $(".close_card_btn.close_right, .close_card_btn_enhance").click @moveBackRight
    $(".close_card_btn.close_left, .close_card_btn_create").click @moveBackLeft

    @prevService = $(".prev_service")
    @nextService = $(".next_service")

    @setupMobileNav()

  setupMobileNav: ->
    links = $("#mobile_nav a").splice(2)
    qs = window.location.href.split("?")[1]
    activeSection = if qs? then qs.split("=")[1] else null

    index = 0
    for link in links
      if link.href.indexOf('/features/index.html?section') > -1

        classes = "service_nav_item"
        if link.href.lastIndexOf(activeSection) > -1
          classes += " active"

          prevLink = links[index-1]
          nextLink = links[index+1]

          if prevLink?
            @prevService.show().prop("href", prevLink)
          else
            @prevService.hide()

          if nextLink?
            @nextService.show().prop("href", nextLink)
          else
            @nextService.hide()

        $("#services_mobile_nav .nav_items").append($("<a class='#{classes}' href='#{link.href}'>&nbsp;</a>"))
        $(".mobile_active").removeClass("mobile_active")
        $("#services_#{activeSection}").addClass("mobile_active")
        $("#mobile_nav .active").removeClass("active")
        $("#mobile_nav .#{activeSection}").addClass("active")

      index++

  fadeToBack: (e) ->
    e.preventDefault()
    target = $(this)
    front = target.parents("div.card")
    back = front.next()
    front.animate {
      opacity: 0
      zIndex: 1
    }, 250
    back.animate {
      opacity: 1
      zIndex: 2
    }, 500

  fadeToFront: (e) ->
    e.preventDefault()
    target = $(this)
    front = target.parents("div.card")
    back = front.prev()
    front.animate {
      opacity: 0
      zIndex: 1
    }, 250
    back.animate {
      opacity: 1
      zIndex: 2
    }, 500

  fadeToFirst: (e) ->
    e.preventDefault()
    $("#create_engaging_posts").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_useful_apps").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_effective_ads").animate {
      opacity: 1
      zIndex: 2
    }, 1

  fadeToSecond: (e) ->
    e.preventDefault()
    $("#create_effective_ads").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_engaging_posts").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_useful_apps").animate {
      opacity: 1
      zIndex: 2
    }, 1

  fadeToThird: (e) ->
    e.preventDefault()
    $("#create_effective_ads").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_useful_apps").animate {
      opacity: 0
      zIndex: 1
    }, 500
    $("#create_engaging_posts").animate {
      opacity: 1
      zIndex: 2
    }, 1

  moveLeft: (e) ->
    e.preventDefault()
    targetParent = $(this).parent()
    main = targetParent
    card = targetParent.next()
    main.animate {
      marginLeft: '-=' + parseInt(4000)
    }, 1
    card.animate {
      marginRight: '+=' + parseInt(4000)
    }, 1

  moveBackRight: (e) ->
    e.preventDefault()
    target = $(this)
    card = target.parents("div.flipping_card")
    main = card.prev()
    main.animate {
      marginLeft: '+=' + parseInt(4000)
    }, 1
    card.animate {
      marginRight: '-=' + parseInt(4000)
    }, 1

  moveRight: (e) ->
    e.preventDefault()
    targetParent = $(this).parent()
    main = targetParent
    card = targetParent.prev()
    main.animate {
      marginRight: '-=' + parseInt(4000)
    }, 1
    card.animate {
      marginLeft: '+=' + parseInt(4000)
    }, 1

  moveBackLeft: (e) ->
    e.preventDefault()
    target = $(this)
    card = target.parents("div.flipping_card")
    main = card.next()
    main.animate {
      marginRight: '+=' + parseInt(4000)
    }, 1
    card.animate {
      marginLeft: '-=' + parseInt(4000)
    }, 1
    
    

new Features()



