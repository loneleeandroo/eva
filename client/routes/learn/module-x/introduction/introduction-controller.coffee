# Set template name
templateName = "introduction"

# Route
Router.map ->
  @route templateName,
    path: "/learn/module-x/introduction"
  return

# Session Variables
Template[templateName].modalTitle = ->
  return Session.get("modalTitle")

Template[templateName].modalBody = ->
  return Session.get("modalBody")

Template[templateName].modalButtonText = ->
  return Session.get("modalButtonText")

# Rendered
Template[templateName].rendered = ->
  Meteor.typeahead( $('.typeahead') )
  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#e74c3c')
  $('body').css('background-color', '#e74c3c')

  this.$('.items').sortable(
    connectWith: ".items"
    stop: (event, ui) ->
      if ui.item.parent().attr("id") isnt "question-basket"
        $('#question-basket').append(ui.item.siblings())
  )

# Events
Template[templateName].events 
  "click button#modal-button": (event) ->
    $('#createNewModal').modal('hide')
    if Session.get("isCorrect")
      $('#createNewModal').on 'hidden.bs.modal', (e) ->
        Router.go('module-x') 

  "click a.check-answer": (event) ->
    # template data, if any, is available in 'this'
    answerBasket = $('.answer-basket')
    valid = true;
    items = Template[templateName].items()

    $.each answerBasket, (k, v) ->
      basketName = $(v).attr('id')
      childName = $(v).val()

      if childName
        i = 0

        while i < items.length
          if items[i].value is childName
            if items[i].group isnt basketName
              valid = false
          i++
      else
        valid = false

    if valid
      $('#createNewModal').modal('show')
      Session.set("modalTitle", "That was correct. You're done!")
      Session.set("modalBody", "Well done! You've successfully completed this topic.")
      Session.set("modalButtonText", "Finish")
      Session.set("isCorrect", true)
    else
      $('#createNewModal').modal('show')
      Session.set("modalTitle", "Sorry that was incorrect")
      Session.set("modalBody", "Please try again.")
      Session.set("modalButtonText", "Okay")
      Session.set("isCorrect", false)

    return

# Collections
Template[templateName].items = ->
  items = [
    { 
      _id: "58065c7ae6c5bff2f97deb85"
      value: "America"
      group: "passage-position-1"
    }
    { 
      _id: "03b1d20081a2d28f60ee1344"
      value: "Japan"
      group: "passage-position-2"
    }
    { 
      _id: "dc36c3d67642c6fa0c06d111"
      value: "24 hours"
      group: "passage-position-3"
    }
    { 
      _id: "3692640a941f40e5325ebaf7"
      value: "cans"
      group: "passage-position-4"
    }
    { 
      _id: "e38d4216c4dec4c4a540bce4"
      value: "bottles"
      group: "passage-position-5"
    }
    { 
      _id: "2c0d2c5308542f094f375276"
      value: "onigiri"
      group: "passage-position-6"
    }
    { 
      _id: "52d91290522a4005f36e57b6"
      value: "sandwiches"
      group: "passage-position-7"
    }
    { 
      _id: "44cd30615151949ef16c2077"
      value: "spaghetti"
      group: "passage-position-8"
    }
    { 
      _id: "5c15889ef731f8778f2a4fbf"
      value: "sake"
      group: "passage-position-9"
    }
    { 
      _id: "f330390061e39aeeb2fe1e44"
      value: "snacks"
      group: "passage-position-10"
    }
    { 
      _id: "07728e062ae68cb9335d679a"
      value: "services"
      group: "passage-position-11"
    }
    { 
      _id: "ed8fdbb7019de6aa27878a16"
      value: "copy machines"
      group: "passage-position-12"
    }
    { 
      _id: "7b388dceea9bb71de1bddc0d"
      value: "salarymen"
      group: "passage-position-13"
    }
  ]
  items
