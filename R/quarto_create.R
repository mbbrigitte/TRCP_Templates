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
  
  files_to_copy <- c(
    "skeleton.qmd",
    "references.bib",
    "styleq.css"
  )


  for (file in files_to_copy) {

    source <- file.path(template_dir, file)

    if (!file.exists(source)) {
      stop("Template file missing: ", source)
    }

    destination_name <- ifelse(
      file == "skeleton.qmd",
      filename,
      file
    )

    destination <- file.path(path, destination_name)

    file.copy(
      source,
      destination,
      overwrite = FALSE
    )
  }

  message("Created TRCP Quarto report: ", file.path(path, filename))

  invisible(path)
}