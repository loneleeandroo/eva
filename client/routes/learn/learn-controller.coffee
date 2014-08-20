# Set template name
templateName = "learn"

# Route
Router.map ->
  @route templateName,
    path: "/learn"
  return

Template[templateName].modules= ->

  modules = [
    {
      english: "Shopping & Convenience Stores"
      japanese: [
        {
          display: "買い物"
          phonetic: "かいもの"
        }
        {
          display: "と"
        }
        {
          display: "コンビニ"
        }
      ]
      imageUrl: "images/shibuya109.jpg"
      moduleUrl: "/learn/module-x"
      private: false
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Myself & Family"
      japanese: [
        {
          display: "私"
          phonetic: "わたし"
        }
        {
          display: "と"
        }
        {
          display: "家族"
          phonetic: "かぞく"
        }
      ]
      moduleUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Interests"
      japanese: [
        {
          display: "趣味"
          phonetic: "しゅみ"
        }
      ]
      moduleUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
  ]

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