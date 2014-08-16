# Set template name
templateName = "index"

# Route
Router.map ->
  @route templateName,
    waitOn: ->
      Meteor.subscribe "slides"
      return
    path: "/"
    onBeforeAction: ->
      #Router.go "/sign-in" unless Meteor.loggingIn() and Meteor.user()
      AccountsEntry.signInRequired this
      return
    action: ->
      if @ready()
        @render()
      else
        @render "loading"
      return

  return

# Collection
Template[templateName].slides = ->
  return Slides.find().fetch()

# Rendered
Template[templateName].rendered = ->
  Holder.run()

  this.$('#items').sortable()
  this.$('.module-list').sortable()
  this.$('.topic-list').sortable()

# Events
Template[templateName].events 
  "click a.add-thumbnail": ->
    # template data, if any, is available in 'this'
    slide = title: "Slide " + (Slides.find().count()+1)
    Slides.insert slide
    return
