library(testthat)

package_name <- Sys.getenv("_R_CHECK_PACKAGE_NAME_")
library(package_name, character.only = TRUE)

test_check(package_name)
