# Set template name
templateName = "learn"

# Route
Router.map ->
  @route templateName,
    path: "/learn"
  return

# Rendered
Template[templateName].rendered = ->
  $('header').hide()
  $('footer').hide()
  $('html').css('background-color', '#1abc9c')
  $('body').css('background-color', '#1abc9c')

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
      imageUrl: "/images/shopping.png"
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
      imageUrl: "/images/family.png"
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
      imageUrl: "/images/interests.png"
      moduleUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
  ]
  modules