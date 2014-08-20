# Set template name
templateName = "learn"

# Route
Router.map ->
  @route templateName,
    path: "/learn"
  return

Template[templateName].modules= ->

  modules = []
  i = 0

  while i < 3
    data =
      title: "Module " + (i+1)
      _id: new Meteor.Collection.ObjectID()._str

    modules.push data
    i++

  return modules

# Rendered
Template[templateName].rendered = ->

  $('.carousel-primary-navigation').slick(
    dots: true
    slidesToShow: 4
    slidesToScroll: 4
    responsive: [
      {
        breakpoint: 1200
        settings: 
          slidesToShow: 3
          slidesToScroll: 3
      }
      {
        breakpoint: 992
        settings: 
          slidesToShow: 2
          slidesToScroll: 2
      }
      {
        breakpoint: 768
        settings: 
          slidesToShow: 1
          slidesToScroll: 1
      }
    ]
  )
  

  $('.slick').slick(
    centerMode: true
    centerPadding: '60px'
    slidesToShow: 3
    slidesToScroll: 3
  )

  Holder.run()

  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#1abc9c')
  $('body').css('background-color', '#1abc9c')