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
  return [
    {
      title: "Module X"
      _id: new Meteor.Collection.ObjectID()._str
      topics: [
        {
          title: "Topic A"
          _id: new Meteor.Collection.ObjectID()._str
          slides: [
            {
              title: "Slide 1"
            }
            {
              title: "Slide 2"
            }
          ]
        }
        {
          title: "Topic B"
          _id: new Meteor.Collection.ObjectID()._str
          slides: [
            {
              title: "Slide 3"
            }
          ]
        }
        {
          title: "Topic C"
          _id: new Meteor.Collection.ObjectID()._str
          slides: [
            {
              title: "Slide 4"
            }
          ]
        }
      ]
    }
    {
      title: "Module Y"
      _id: new Meteor.Collection.ObjectID()._str
      topics: [
        {
          title: "Topic D"
          _id: new Meteor.Collection.ObjectID()._str
          slides: [
            {
              title: "Slide 5"
            }
          ]
        }
        {
          title: "Topic E"
          _id: new Meteor.Collection.ObjectID()._str
          slides: [
            {
              title: "Slide 6"
            }
          ]
        }
      ]
    }
  ]

# Rendered
Template[templateName].rendered = ->
  Holder.run()

  this.$('.module-list').sortable()
  this.$('.topic-list').sortable(
    connectWith: ".topic-list"
  )
  this.$('.slides').sortable()

# Events
Template[templateName].events 
  "click a.add-thumbnail": ->
    # template data, if any, is available in 'this'
    slide = title: "Slide " + (Slides.find().count()+1)
    Slides.insert slide
    return
