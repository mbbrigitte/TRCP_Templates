#' Create a TRCP Quarto report template
#'
#' Copies the TRCP Quarto skeleton into the current project folder.
#'
#' @param path Folder where the report should be created.
#' @param filename Name of the qmd file.
#'
#' @export
quarto_create <- function(path = ".", filename = "report.qmd") {
  
  template <- system.file(
    "rmarkdown",
    "templates",
    "standard",
    "skeleton",
    "skeleton.qmd",
    package = "TRCPTemplatePackage"
  )
  
  if (template == "") {
    stop("Quarto template not found. Is the package installed?")
  }
  
  destination <- file.path(path, filename)
  
  if (file.exists(destination)) {
    stop("File already exists: ", destination)
  }
  
  file.copy(template, destination)
  
  message("Created: ", destination)
}