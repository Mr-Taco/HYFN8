
$( document ).ready(function() {
    //track demo button
    $('button').on('click', function() {
        ga('send', 'event', 'button', $(this).parent().attr('class'), 'request-demo');
    });
    //one sheeter
    $('.btn').on('click', function() {
        ga('send', 'event', 'button','download-onesheet');
    });
    //job apply button
    $('#about_us_content .jobs a').on('click', function() {
        ga('send', 'event', 'button', 'apply-job', $(this).attr('href'));
    });
    //contact/contact-us button click
    $('#carousel.contact .contact_us').on('click', function() {
        ga('send', 'event', 'button', 'contact-us', $(this).attr('id'));
    });
    //services nav button lcick
    $('#services_nav table a').on('click', function() {
        ga('send', 'event', 'button', 'services-nav', $(this).attr('href'));
    });
    //learn more button click (pageview)
    $('.service_section a').on('click', function() {
        ga('send', {
            'hitType':'pageview',
            'page': $(this).attr('href')});
    });
    //internal card tab click (pageview)
    $('.card td').on('click', function() {
          ga('send', {
            'hitType':'pageview',
            'page': $(this).text()});
    });
    //close contact form
    $('#form_header img').on('click', function() {
        ga('send', 'event', 'close', 'contact-form', $(this).parent().text());
    });
    //close demo form
    $('#demo_header img').on('click', function() {
        ga('send', 'event', 'close', 'demo-form');
    });

});
