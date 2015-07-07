class Application

  quotes: [
    {author: "Katie North, Director of Marketing and Corporate Communications at MobiTV, Inc.", quote: "Hyfn8 is a very sleek platform with all the bells and whistles. The listening tools they’ve developed have been drilled down to offer a level of specificity I haven’t seen from  other services."}
    {author: "Tom Lerra, SVP, Director of Digital Operations, Mullen", quote: "Hyfn provides what all agencies look for, a trusted, competent and forward thinking digital partner. No mission has been too difficult to date and they engender 100% confidence that the job will get done to spec and with excellence."}
    {author: "Stuart Culpepper, VP Associate Director of Interactive Production, Publicis Kaplan Thaler", quote: "HYFN has been a go-to partner for our agency for the past three years. They've distinguished themselves with superior work and a willingness to take on challenging projects and timelines with a positive can-do attitude."}
  ]

  constructor: ->
    @testimonial = $("#testimonial")
    @showTestimonials()
    @setupMobileNav()

  showTestimonials: ->
    rnd = Math.floor((Math.random()*3))
    randomQuote = @quotes[rnd]

    @testimonial.find(".quote").text("#{randomQuote.quote}")
    @testimonial.find(".author").text(randomQuote.author)

  setupMobileNav: ->
      nav = $("#mobile_nav")
      # SETUP THE TOP NAV
      $("#mobile_nav_launch, #mobile_nav_close").click =>
        nav.toggleClass("open")

        window.setTimeout =>
          if nav.hasClass("open")
            $("#mobile_nav_launch").css("display", "none")
            $("#mobile_nav_close").css("display", "block")
          else
            $("body, html").animate({
              'scrollTop':  0
            }, 500)
            $("#mobile_nav_close").css("display", "none")
            $("#mobile_nav_launch").css("display", "block")
        , 1000

new Application()