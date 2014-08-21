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
  topics = [
    {
      english: "Introduction"
      japanese: [
        {
          display: "イントロダクション"
        }
      ]
      imageUrl: "/images/introduction.png"
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Products 1"
      japanese: [
        {
          display: "商品"
          phonetic: "しょうひん"
        }
        {
          display: "①"
        }
      ]
      imageUrl: "/images/products1.png"
      topicUrl: "/learn/module-x/products-1"
      private: false
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Products 2"
      japanese: [
        {
          display: "商品"
          phonetic: "しょうひん"
        }
        {
          display: "②"
        }
      ]
      imageUrl: "/images/products2.png"
      topicUrl: "/learn/module-x/products-2"
      private: false
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Expressions"
      japanese: [
        {
          display: "表現"
          phonetic: "ひょうげん"
        }
      ]
      imageUrl: "/images/expressions.png"
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Japan vs Australia"
      japanese: [
        {
          display: "日本"
          phonetic: "にほん"
        }
        {
          display: "と"
        }
        {
          display: "オーストラリア"
        }
      ]
      imageUrl: ""
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Department Stores"
      japanese: [
        {
          display: "デパート"
        }
      ]
      imageUrl: ""
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
    {
      english: "Supermarkets"
      japanese: [
        {
          display: "スーパー"
        }
      ]
      imageUrl: ""
      topicUrl: "#"
      private: true
      _id: new Meteor.Collection.ObjectID()._str
    }
  ]
  topics