# Set template name
templateName = "slide-2"

shuffleArray = (array) ->
  i = array.length - 1

  while i > 0
    j = Math.floor(Math.random() * (i + 1))
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i--
  array

# Route
Router.map ->
  @route templateName,
    path: "/learn/module-x/topic-x/slide-2"
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
  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#e74c3c')
  $('body').css('background-color', '#e74c3c')

  this.$('.items').sortable(
    connectWith: ".items"
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
    questionBasket = $('#question-basket')
    valid = false;
    items = Template[templateName].items()

    if questionBasket.children().length is 0
      valid = true
      $.each answerBasket, (k, v) ->
        children = $(v).children()
        basketName = $(v).attr('id')

        $.each children, (key, value) ->
          childName = $(value).attr('id')

          i = 0

          while i < items.length
            if items[i].japanese is childName
              if items[i].group isnt basketName
                valid = false
            i++

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
      japanese: "ペン",
      english: "Pen",
      group: "Lifestyle"
    }
    {
      japanese: "はブラシ",
      english: "Toothbrush",
      group: "Lifestyle"
    }
    {
      japanese: "ノート",
      english: "Notebook",
      group: "Lifestyle"
    }
    {
      japanese: "ざっし",
      english: "Magazine",
      group: "Lifestyle"
    }
    {
      japanese: "まんが",
      english: "Manga",
      group: "Lifestyle"
    }
    {
      japanese: "パンツ",
      english: "Underpants",
      group: "Lifestyle"
    }
    {
      japanese: "かさ",
      english: "Umbrella",
      group: "Lifestyle"
    }
    {
      japanese: "コーヒー",
      english: "Coffee",
      group: "Beverage"
    }
    {
      japanese: "アイス",
      english: "Ice-Cream",
      group: "Food"
    }
    {
      japanese: "おでん",
      english: "Oden",
      group: "Food"
    }
    {
      japanese: "おにぎり",
      english: "Onigiri",
      group: "Food"
    }
    {
      japanese: "ポテトチップス",
      english: "Potato Chips",
      group: "Food"
    }
    {
      japanese: "デザート",
      english: "Dessert",
      group: "Food"
    }
    {
      japanese: "シャンプー",
      english: "Shampoo",
      group: "Lifestyle"
    }
    {
      japanese: "タバコ",
      english: "Cigarettes",
      group: "Lifestyle"
    }
    {
      japanese: "カイロ",
      english: "Hand Warmer",
      group: "Lifestyle"
    }
    {
      japanese: "くだもの",
      english: "Fruit",
      group: "Food"
    }
    {
      japanese: "やさい",
      english: "Vegetables",
      group: "Food"
    }
    {
      japanese: "おちゃ",
      english: "Tea",
      group: "Beverage"
    }
    {
      japanese: "ぎゅうにゅう",
      english: "Milk",
      group: "Beverage"
    }
    {
      japanese: "パン",
      english: "Bread",
      group: "Food"
    }
    {
      japanese: "おべんとう",
      english: "Bento",
      group: "Food"
    }
    {
      japanese: "カップラーメン",
      english: "Cup Ramen",
      group: "Food"
    }
    {
      japanese: "にくまん",
      english: "Meat Bun",
      group: "Food"
    }
  ]

  return shuffleArray(items)