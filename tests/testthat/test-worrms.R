test_that("multiplication works", {
  vcr::use_cassette("worrms", {
    expect_error(worrms::wm_children(44444))
  })
})
