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
      _id: 'f29bf281c4bfe811529e4385',
      japanese: "ペン",
      english: "Pen",
      group: "Lifestyle"
    }
    {
      _id: '90f202059a06843caa0958e9',
      japanese: "はブラシ",
      english: "Toothbrush",
      group: "Lifestyle"
    }
    {
      _id: 'be00ffb4ad9e9a57addee52b',
      japanese: "ノート",
      english: "Notebook",
      group: "Lifestyle"
    }
    {
      _id: 'b9b88f0c3cb01a73d6f1884a',
      japanese: "ざっし",
      english: "Magazine",
      group: "Lifestyle"
    }
    {
      _id: '92ef220b2dd7631f5af9c7a1',
      japanese: "まんが",
      english: "Manga",
      group: "Lifestyle"
    }
    {
      _id: 'c1f38f590d24d2662edab2ee',
      japanese: "パンツ",
      english: "Underpants",
      group: "Lifestyle"
    }
    {
      _id: '273bf315cddf1844f93d0498',
      japanese: "かさ",
      english: "Umbrella",
      group: "Lifestyle"
    }
    {
      _id: 'da1479a2a1732e1514a9b1d4',
      japanese: "コーヒー",
      english: "Coffee",
      group: "Beverage"
    }
    {
      _id: '82a48b86b8c313f1392cfe7f',
      japanese: "アイス",
      english: "Ice-Cream",
      group: "Food"
    }
    {
      _id: '2b2530e45d09d2ba5bef5682',
      japanese: "おでん",
      english: "Oden",
      group: "Food"
    }
    {
      _id: 'b3e16add1e3f073b476e15c9',
      japanese: "おにぎり",
      english: "Onigiri",
      group: "Food"
    }
    {
      _id: '146d16080e3ecc6686f11b79',
      japanese: "ポテトチップス",
      english: "Potato Chips",
      group: "Food"
    }
    {
      _id: '15f43eb292b355ac51f2e980',
      japanese: "デザート",
      english: "Dessert",
      group: "Food"
    }
    {
      _id: '0fb3f98035c024d7a09ffe55',
      japanese: "シャンプー",
      english: "Shampoo",
      group: "Lifestyle"
    }
    {
      _id: 'e8101229c58549449f7c3cd5',
      japanese: "タバコ",
      english: "Cigarettes",
      group: "Lifestyle"
    }
    {
      _id: 'ef81575a531d94897b64a944',
      japanese: "カイロ",
      english: "Hand Warmer",
      group: "Lifestyle"
    }
    {
      _id: 'a8b6a012a510e60bfb7f49d3',
      japanese: "くだもの",
      english: "Fruit",
      group: "Food"
    }
    {
      _id: '343bffd369e7423297c855f7',
      japanese: "やさい",
      english: "Vegetables",
      group: "Food"
    }
    {
      _id: '4d56ec049b48f149621186fb',
      japanese: "おちゃ",
      english: "Tea",
      group: "Beverage"
    }
    {
      _id: '747a1667f1f6d67fc7a7f5f8',
      japanese: "ぎゅうにゅう",
      english: "Milk",
      group: "Beverage"
    }
    {
      _id: '93c5bf6d5392ce73557dbe8c',
      japanese: "パン",
      english: "Bread",
      group: "Food"
    }
    {
      _id: '8a511966887d555aa6d957d0',
      japanese: "おべんとう",
      english: "Bento",
      group: "Food"
    }
    {
      _id: '46bdcc8dca30b734f17fce44',
      japanese: "カップラーメン",
      english: "Cup Ramen",
      group: "Food"
    }
    {
      _id: 'adeeba0479a83d2236a0ebd8',
      japanese: "にくまん",
      english: "Meat Bun",
      group: "Food"
    }
  ]

  shuffleArray(items)