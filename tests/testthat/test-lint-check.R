context("Lint package")

test_that("Linting package", {
  # Given
  # Package code
  path <-
    if (!identical(Sys.getenv("_R_CHECK_PACKAGE_NAME_"), ""))
      inst_path(glue::glue("../00_pkg_src/{packageName()}"))
    else
      inst_path("../")

  excluded_dirs <- c(
    "inst/doc"
  )
  excluded_files <- unlist(
    lapply(
      excluded_dirs,
      function(dir) {
        list.files(paste0(path, "/", dir), recursive = TRUE, full.names = TRUE)
      }
    )
  )

  # When
  config <- lintr::with_defaults(
    # all default checks
    default = lintr:: default_linters,
    # allows bigger line length
    line_length_linter = lintr::line_length_linter(120),
    # allow different var names in the project
    object_name_linter = NULL
  )

  # Then
  lintr::expect_lint_free(
    path = path,
    relative_path = FALSE,
    linters = config,
    cache = TRUE,
    exclusions = excluded_files
  )
})
