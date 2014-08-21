# Set template name
templateName = "module-x"

# Route
Router.map ->
  @route templateName,
    path: "/learn/module-x"
  return

# Rendered
Template[templateName].rendered = ->
  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#3498db')
  $('body').css('background-color', '#3498db')

# Collections
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
      imageUrl: "images/shopping.png"
      moduleUrl: "/learn/module-x"
      private: false
      _id: new Meteor.Collection.ObjectID()._str
    }
  ]
  modules

Template[templateName].topics= ->
  topics = []
  i = 0

  while i < 8
    data =
      english: "Topic " + (i+1)
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
      imageUrl: "/images/shopping.png"
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str

    if i is 0
      data.topicUrl = '/learn/module-x/topic-x/slide-1'
      data.private = false

    topics.push data
    i++

  topics