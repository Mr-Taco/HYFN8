class demo_form

  constructor: ->
    @setupDemoForm()

  setupDemoForm: ->
    form = $("#demo_form")
    form_mobile = $("#demo_mobile")
    form_container = $("#demo_container")
    overlay = $("#overlay")
    body = $("body")
    index = 0
    $("#bottom_footer_request, #top_footer_request, #exit_demo, .request_button_blue").click =>
      body.toggleClass("no_scroll");
      @resetForm()
      if index == 0
        overlay.fadeToggle(500);
        form_container.animate {
          marginTop: '+=' + parseInt(1200)
        }, 1
        index = 1

      else
        form_container.animate {
          marginTop: '-=' + parseInt(1200)
        }, 1
        overlay.fadeToggle(500);
        index = 0

    form.h5Validate({
      errorClass:'error'
    })

    form_mobile.h5Validate({
      errorClass:'error'
    })

    form.submit (e) =>
      e.preventDefault()

      if form.h5Validate('allValid')
        @sendFormData(form.serialize())

    form_mobile.submit (e) =>
      e.preventDefault()

      if form_mobile.h5Validate('allValid')
        @sendFormData(form_mobile.serialize())

  sendFormData: (dataObj) ->
    $.ajax
      type: "POST"
      dataType: "json"
      url: "#{App.api_url}/contact?callback=?"
      data: dataObj
      success: =>
        window.location.href = "/thank_you"

      error: =>
        alert "An error occurred. Please try again."

  resetForm: ->
    $('input').removeClass('error');
    $('input').val('');
    $('textarea').removeClass('error');
    $('textarea').val('');

new demo_form()



