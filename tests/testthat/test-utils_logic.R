# targets::tar_test() runs the test code inside a temporary directory
# to avoid accidentally writing to the user's file space.

# These tests check the correctness of internal logical operators
targets::tar_test("%|||% works correctly", {
  expect_equal("x" %|||% "y", "x")
  expect_equal(character(0) %|||% "y", character(0))
  expect_equal(NA_character_ %|||% "y", NA_character_)
  expect_equal(NULL %|||% "y", "y")
})

targets::tar_test("%||% works correctly", {
  expect_equal("x" %||% "y", "x")
  expect_equal(character(0) %||% "y", "y")
  expect_equal(NA_character_ %||% "y", NA_character_)
  expect_equal(NULL %||% "y", "y")
})

targets::tar_test("%||NA% works correctly", {
  expect_equal("x" %||NA% "y", "x")
  expect_equal(character(0) %||NA% "y", character(0))
  expect_equal(NA_character_ %||NA% "y", "y")
  expect_equal(NULL %||NA% "y", NULL)
})

targets::tar_test("if_any() works correctly", {
  expect_equal(if_any(TRUE, "x", "y"), "x")
  expect_equal(if_any(FALSE, "x", "y"), "y")
})
