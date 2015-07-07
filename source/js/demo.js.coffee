class demo_form

  constructor: ->
    @setupDemoForm()

  setupDemoForm: ->
    form1 = $("#demo_form")
    form = $("#demo_mobile")
    form_container = $("#demo_container")
    overlay = $("#overlay")
    body = $("body")
    $("#top_header_request, #bottom_footer_request, #top_footer_request, #exit_demo, #social_demo, #space_demo").click =>
      body.toggleClass("no_scroll");
      overlay.fadeToggle("1000");
      form_container.toggleClass("open");
      @resetForm()

    $("#demo_form, #demo_mobile").h5Validate({
      errorClass:'error'
    })

    form.submit (e) =>
      e.preventDefault()

      if form.h5Validate('allValid')
        $.ajax
          type: "POST"
          dataType: "json"
          url: "#{App.api_url}/contact?callback=?"
          data: form.serialize()
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



