# Set template name
templateName = "index"

# Route
Router.map ->
  @route templateName,
    path: "/",
    onBeforeAction: ->
      Router.go "/sign-in" unless Meteor.loggingIn() and Meteor.user()
      return
  return

# Collection
Template[templateName].greeting = ->
  "Welcome to " + Meteor.user().emails[0].address  if Meteor.user() and Meteor.user().emails

# Events
Template[templateName].events "click input": ->
  # template data, if any, is available in 'this'
  console.log "You pressed the button"  if typeof console isnt "undefined"
  return
