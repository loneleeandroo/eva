# Set template name
templateName = "privacy-policy"

# Route
Router.map ->
  @route templateName,
    path: "/" + templateName
  return