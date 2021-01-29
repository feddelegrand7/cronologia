
test_that("expect create_tml() to return an error when
          a column does not belong to a dataframe
          ", {


  expect_error(

    create_tml(mtcars,
               smr = "mpg",
               dsc = "tacos")

  )

  expect_error(

    create_tml(mtcars,
               smr = "tacos",
               dsc = "mpg")

  )

          })



test_that("expect create_tml_img() to return an error when
          a column does not belong to a dataframe", {


            expect_error(

              create_tml_img(mtcars,
                             smr = "mpg",
                             dsc = "wt",
                             imgsrc = "tacos",
                             imgalt = "disp")

            )

            expect_error(

              create_tml_img(mtcars,
                             smr = "tacos",
                             dsc = "mpg",
                             imgalt = "wt",
                             imgsrc = "qsec"
                            )

            )

            expect_error(

              create_tml_img(mtcars,
                             smr = "cyl",
                             dsc = "mpg",
                             imgalt = "tacos",
                             imgsrc = "drat"
              )

            )

          })


test_that("create_tml() returns an object of class shiny.tag.list", {


  expect_s3_class(

    object = create_tml(mtcars, "mpg", "wt"),

    class = "shiny.tag.list"


  )


})



test_that("create_tml_img() returns an object of class shiny.tag.list", {


  expect_s3_class(

    object = create_tml_img(mtcars,
                            "mpg",
                            "wt",
                            "drat",
                            "disp"),

    class = "shiny.tag.list"


  )


})


test_that("create_tml() returns an object of class list", {


  expect_s3_class(

    object = create_tml(mtcars, "mpg", "wt"),

    class = "list"


  )


})


test_that("create_tml_img() returns an object of class list", {


  expect_s3_class(

    object = create_tml_img(mtcars,
                            "mpg",
                            "wt",
                            "drat",
                            "disp"),

    class = "list"


  )


})


test_that("create_tml() returns an object of type list", {


  expect_type(

    object = create_tml(mtcars, "mpg", "wt"),

    type = "list"


  )


})



test_that("create_tml_img() returns an object of type list", {


  expect_type(

    object = create_tml_img(mtcars,
                            "mpg",
                            "wt",
                            "drat",
                            "disp"),

    type = "list"


  )


})


test_that("create_tml() returns an error when arguments missing", {




  expect_error(

    create_tml(mtcars, smr = "mpg")

  )

  expect_error(

    create_tml(smr = "mpg", dsc = "wt")

  )




})


test_that("create_tml_img() returns an error when arguments missing", {




  expect_error(

    create_tml_img(mtcars,
                   smr = "mpg",
                   dsc = "wt",
                   imgalt = "disp")

  )

  expect_error(

    create_tml_img(mtcars,
                   smr = "mpg",
                   dsc = "wt",
                   imgsrc = "disp")
  )




})
