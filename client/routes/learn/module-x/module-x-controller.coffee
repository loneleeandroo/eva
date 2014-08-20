# Set template name
templateName = "module-x"

# Route
Router.map ->
  @route templateName,
    path: "/learn/module-x"
  return

Template[templateName].modules= ->

  modules = []
  i = 0

  while i < 20
    data =
      title: "Module " + (i+1)
      _id: new Meteor.Collection.ObjectID()._str

    modules.push data
    i++

  return modules

Template[templateName].topics= ->

  topics = []
  i = 0

  while i < 8
    data =
      title: "Topic " + (i+1)
      _id: new Meteor.Collection.ObjectID()._str

    topics.push data
    i++

  return topics

# Rendered
Template[templateName].rendered = ->
  Holder.run()

  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#3498db')
  $('body').css('background-color', '#3498db')