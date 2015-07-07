
class contact_form

  constructor: ->
    @setupFormOpen()

  setupFormOpen: ->
    container = $("#form_container")
    overlay = $("#overlay")
    body = $("body")
    form = $("#contact_form")
    mobile_contact = $("#demo_mobile_contact")
    index = 0
    $("#customer, #media, #about, #general, #exit_contact").click =>
      body.toggleClass("no_scroll");
      overlay.fadeToggle(500);
      @resetForm()
      if index == 0
        container.animate {
          marginTop: '+=' + parseInt(1200)
        }, 500
        index = 1

      else
        container.animate {
          marginTop: '-=' + parseInt(1200)
        }, 1
        index = 0

    $("#header_contact.active").click (e) =>
      e.preventDefault()
      body.toggleClass("no_scroll");
      overlay.fadeToggle(500);
      @resetForm()
      if index == 0
        container.animate {
          marginTop: '+=' + parseInt(1200)
        }, 500
        index = 1

      else
        container.animate {
          marginTop: '-=' + parseInt(1200)
        }, 1
        index = 0

    form.h5Validate({
      errorClass:'error'
    })

    mobile_contact.h5Validate({
      errorClass:'error'
    })

    form.submit (e) =>
      e.preventDefault()

      if form.h5Validate('allValid')
        @sendFormData(form.serialize())

    mobile_contact.submit (e) =>
      e.preventDefault()

      if mobile_contact.h5Validate('allValid')
        @sendFormData(mobile_contact.serialize())

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


new contact_form()