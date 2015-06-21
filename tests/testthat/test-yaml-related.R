context("test yaml injections work")

has_output_lines <- readLines("../has_output_yaml.Rmd")
no_output_lines <- readLines("../no_output_yaml.Rmd")

# results
has_output_lines_injected <- readLines("../has_output_yaml_injected.Rmd")
no_output_lines_injected <- readLines("../no_output_yaml_injected.Rmd")

test_that("indices returned properly for yaml", {
  expect_equal(output_indices(has_output_lines), c(5, 9))
  expect_equal(output_indices(no_output_lines), c(5))
})

test_that("output md injected properly", {
  expect_equal(inject_yaml_md_output("../has_output_yaml.Rmd", write=F), has_output_lines_injected)
  expect_equal(inject_yaml_md_output("../no_output_yaml.Rmd", write=F), no_output_lines_injected)
})
