# Script containing unit tests
#library(testthat)
#source('functions.R')


context("standardize function")

test_that("standardize works", {
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(standardize(a), c(-1, 0, 1))
  expect_equal(standardize(b), rep(NA_real_, 4))
  expect_equal(standardize(b, na.rm = TRUE), c(-1, 0, 1, NA))
})

test_that("standardize throws error", {
  strings <- c('1', '2', '3')
  expect_error(standardize(strings))
})


context("rescale function")

test_that("rescale works", {
  a <- c(1, 2, 3)
  b <- c(1, 2, 3, NA)
  expect_equal(rescale(a), c(0, 0.5, 1))
  expect_equal(rescale(b), rep(NA_real_, 4))
  expect_equal(rescale(b, na.rm = TRUE), c(0, 0.5, 1, NA))
})

test_that("rescale throws error", {
  strings <- c('1', '2', '3')
  expect_error(rescale(strings))
})

