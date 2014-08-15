# Set template name
templateName = "terms-of-use"

# Route
Router.map ->
  @route templateName,
    path: "/" + templateName
  return