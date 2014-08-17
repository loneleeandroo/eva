# Set template name
templateName = "learn"

# Route
Router.map ->
  @route templateName,
    path: "/learn"
  return

Template[templateName].items= ->
  return [
    {
      name: "Apple"
    }
    {
      name: "Pencil"
    }
    {
      name: "Rubber"
    }
    {
      name: "Orange"
    }
    {
      name: "Coca-Cola"
    }
    {
      name: "Water"
    }
  ]

# Rendered
Template[templateName].rendered = ->
  Holder.run()

  this.$('#shopping-cart').sortable(
    connectWith: "#items"
  )

  this.$('.items').sortable(
    connectWith: ".items"
  )