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
Template[templateName].modules = ->
  return Modules.find().fetch()

# Rendered
Template[templateName].rendered = ->
  Holder.run()

  this.$('.module-list').sortable()
  this.$('.topic-list').sortable(
    connectWith: ".topic-list"
  )
  this.$('.slides').sortable(
    connectWith: ".slides"
    cancel: ".unsortable-thumbnail"
    stop: (event, ui) ->
      if (ui.item.is(':last-child'))
        ui.item.insertBefore(ui.item.siblings(".unsortable-thumbnail"))
  )

# Events
Template[templateName].events 
  "click a.add-thumbnail": ->
    # template data, if any, is available in 'this'
    
    return
