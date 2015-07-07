getFace = ($el) ->
  for num in [1,2,3,4,5,6,7]
    return num if $el.hasClass("face-#{num}")

nextFace = ($pane) ->
  num = getFace($pane)
  thisF = "face-#{num}"
  nextF = "face-#{num % 7 + 1}"

  if Modernizr.csstransitions
    $pane.removeClass(thisF).addClass(nextF)
  else
    $pane.find("."+thisF).fadeOut -> $pane.find("."+nextF).fadeIn ->
      $pane.removeClass(thisF).addClass(nextF)

$ -> $(document).on "click", ".client-logo-pane", -> nextFace($(@))

INTERVAL_LENGTH = 6000
intervalPointer = null

window.LogoFlipper =
  start: ->
    $logos = $(".client-logo-pane")
    intervalPointer = setInterval ->
      $logos.each (i) ->
        $logo = $(@)
        timeOut = i % 6 + i / 6
        setTimeout ->
          nextFace($logo)
        , timeOut * 80
    , INTERVAL_LENGTH


  stop: -> clearInterval(intervalPointer)

$ ->
  if $("#client-logos, #client-logos-mobile").length
    LogoFlipper.start()
  else
    LogoFlipper.stop()