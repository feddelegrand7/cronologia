
#' An internal function used to manage the CSS file dependency
#' @noRd
cronologia_dependency <- function() {

  htmltools::htmlDependency(

    name = "cronologia",

    version = "0.1.0",

    package = "cronologia",

    src = c(file = "cronologia"),

    stylesheet = "cronologia.css",

    all_files = FALSE

  )

}

#' An internal function used to generate HTML tags for the timeline function
#' @noRd
timeline <- function(df,
                     smr,
                     dsc,
                     smr_col,
                     smr_bgcol,
                     dsc_col,
                     dsc_bgcol,
                     dsc_size) {

    func <- function(i, j) {


        htmltools::tagList(

          htmltools::div(
            class = "chronologia-detail-wrapper",

            htmltools::tags$details(

              htmltools::tags$summary(
                i,
                style = glue::glue(

                  "color: {smr_col}; background: {smr_bgcol};"

                  )
              ),

              htmltools::tags$p(
                j,

                style = glue::glue(

                  "color: {dsc_col}; background: {dsc_bgcol}; font-size: {dsc_size};"

                )

                )
            )
          )
        )
    }

    r <- mapply(func, df[[smr]], df[[dsc]], SIMPLIFY = FALSE)

    return(

      htmltools::tagList(
        htmltools::div(class = "chronologia-wrapper", r)
      )
    )


}


#' Create a Vertical HTML Timeline from a Data Frame
#'
#' @param df a data frame containing the necessary information.
#' @param smr the column name that will be used as the summary component.
#' @param dsc the column name that will be used as the description component.
#' @param smr_col text color for the summary component. Defaults to 'white'.
#' @param smr_bgcol background-color for the summary component. Defaults to "#002240".
#' @param dsc_col text color for the description component. Defaults to "#1D1D1D".
#' @param dsc_bgcol background-color for the description component. Defaults to "#FFFFFF".
#' @param dsc_size font size of the description component. Defaults to "14px".
#'
#' @return A Vertical HTML Time Line Widget
#' @export
#'
#' @examples
#'
#' if(interactive()) {
#'
#'df <- data.frame(
#'
#'
#'  date_release = c("May 31, 2005",
#'                   "July 14, 2008",
#'                   "July 16, 2012 "),
#'
#'  description = c("Batman Begins",
#'                  "The Dark Knight",
#'                  "The Dark Knight Rises")
#')
#'
#'ui <- fluidPage(
#'
#'  br(),
#'
#'  h1("Batman Trigoly Timeline", style = "text-align:center"),
#'
#'  br(),
#'
#'
#'  create_tml(df,
#'            "date_release",
#'            "description"),
#'
#'
#'
#')
#'
#'server <- function(input, output) {}
#'
#'shinyApp(ui = ui, server = server)
#'
#'}


create_tml <- function(df,
                       smr,
                       dsc,
                       smr_col = "white",
                       smr_bgcol =  "#002240",
                       dsc_col = "#1D1D1D",
                       dsc_bgcol = "#FFFFFF",
                       dsc_size = "14px"
                      ) {

  if (any(!is.character(smr),
          !is.character(dsc),
          !is.character(smr_col),
          !is.character(smr_bgcol),
          !is.character(dsc_col),
          !is.character(dsc_bgcol),
          !is.character(dsc_size))) {


    stop("All parameters except 'df' must be provided as a character string ! you're not in Tidyverse !!!")

  }


  if(any(!c(smr, dsc) %in% names(df))) {

    stop(glue::glue(

      "Please check the columns' names.

      Note that they need to be provided as a character string in this form:

      (df = mtcars, smr = 'mpg', dsc = 'wt')

      "

    ))

  }


  htmltools::tagList(

    cronologia_dependency(),

    timeline(df,
             smr,
             dsc,
             smr_col,
             smr_bgcol,
             dsc_col,
             dsc_bgcol,
             dsc_size)

  )

}



# Create Time Line with Images --------------------------------------------


#' An internal function used to create HTML tags for the timeline_img function
#' @noRd
timeline_img <- function(df,
                     smr,
                     dsc,
                     imgsrc,
                     imgalt,
                     smr_col,
                     smr_bgcol,
                     dsc_col,
                     dsc_bgcol,
                     dsc_size = "14px",
                     imgheight = "400px",
                     imgwidth = "400px") {


  func <- function(i, j, n, m) {

    htmltools::tagList(

      htmltools::div(
        class = "chronologia-detail-wrapper",

        htmltools::tags$details(

          htmltools::tags$summary(
            i,
            style = glue::glue(

              "color: {smr_col}; background: {smr_bgcol};"

            )
          ),

          htmltools::tags$img(
            src = n,
            alt = m,
            height = imgheight,
            width = imgwidth
          ),

          htmltools::tags$br(),
          htmltools::tags$br(),


          htmltools::tags$p(
            j,

            style = glue::glue(

              "color: {dsc_col}; background: {dsc_bgcol}; font-size: {dsc_size};"

            )

          )
        )
      )
    )
  }

  r <- mapply(func,
              df[[smr]],
              df[[dsc]],
              df[[imgsrc]],
              df[[imgalt]],
              SIMPLIFY = FALSE)

  return(

    htmltools::tagList(
      htmltools::div(class = "chronologia-wrapper", r)
    )
  )


}




#' Create Vertical HTML Timeline Widget with Images from a Data Frame
#'
#' @param df a data frame containing the necessary information.
#' @param smr the column name that will be used as the summary component.
#' @param dsc the column name that will be used as the description component.
#' @param imgsrc the column name indicating the 'href' source of the images.
#' @param imgalt the column name that will be used as 'alt' text for the images.
#' @param smr_col text color for the summary component. Defaults to 'white'.
#' @param smr_bgcol background-color for the summary component. Defaults to "#002240".
#' @param dsc_col text color for the description component. Defaults to "#1D1D1D".
#' @param dsc_bgcol background-color for the description component. Defaults to "#FFFFFF".
#' @param dsc_size font size of the description component. Defaults to "14px".
#' @param imgheight the height of the image. Defaults to "150px".
#' @param imgwidth the width of the image. Defaults to "150px".
#'
#' @return A Vertical HTML Time Line Widget With Images
#' @export


create_tml_img <- function(df,
                       smr,
                       dsc,
                       imgsrc,
                       imgalt,
                       smr_col = "white",
                       smr_bgcol =  "#002240",
                       dsc_col = "#1D1D1D",
                       dsc_bgcol = "#FFFFFF",
                       dsc_size = "14px",
                       imgheight = "150px",
                       imgwidth = "150px") {


  if (any(!is.character(smr),
          !is.character(dsc),
          !is.character(imgsrc),
          !is.character(imgalt),
          !is.character(smr_col),
          !is.character(smr_bgcol),
          !is.character(dsc_col),
          !is.character(dsc_bgcol),
          !is.character(dsc_size),
          !is.character(imgheight),
          !is.character(imgwidth))) {


    stop("All parameters except 'df' must be provided as a character string ! you're not in Tidyverse !!!")

  }


  if(any(!c(smr, dsc, imgsrc, imgalt) %in% names(df))) {

    stop(glue::glue(

      "Please check the columns' names.

      Note that they need to be provided as a character string in this form:

      (df = mtcars, smr = 'mpg', dsc = 'wt', imgsrc = 'disp', imgalt = 'drat')

      "

    ))

  }


  htmltools::tagList(

    cronologia_dependency(),

    timeline_img(df,
             smr,
             dsc,
             imgsrc,
             imgalt,
             smr_col,
             smr_bgcol,
             dsc_col,
             dsc_bgcol,
             dsc_size,
             imgheight,
             imgwidth)

  )

}



# cronologia The Dark Knight ------------------------------------------------------------




#' An internal function used to generate HTML tags for the timeline2 function
#' @noRd

timeline2 <- function(df,
                     smr,
                     dsc,
                     dsc2,
                     smr_col,
                     smr_bgcol,
                     dsc_col,
                     dsc_bgcol,
                     dsc_size,
                     dsc2_col,
                     dsc2_bgcol,
                     dsc2_size) {

  func <- function(i, j, k) {


    htmltools::tagList(

      htmltools::div(
        class = "chronologia-detail-wrapper",

        htmltools::tags$details(

          htmltools::tags$summary(
            i,
            style = glue::glue(

              "color: {smr_col}; background: {smr_bgcol};"

            )
          ),

          htmltools::tags$p(
            j,

            style = glue::glue(

              "color: {dsc_col}; background: {dsc_bgcol}; font-size: {dsc_size};"

            )

          ),


          htmltools::tags$p(

            k,

            style = glue::glue(

              "color: {dsc2_col}; background: {dsc2_bgcol}; font-size: {dsc2_size};"

            )


          )
        )
      )
    )
  }

  r <- mapply(func, df[[smr]], df[[dsc]], df[[dsc2]], SIMPLIFY = FALSE)

  return(

    htmltools::tagList(
      htmltools::div(class = "chronologia-wrapper", r)
    )
  )


}


#' Create a Vertical HTML Timeline with 2 Description Levels from a Data Frame
#'
#' @param df a data frame containing the necessary information.
#' @param smr the column name that will be used as the summary component.
#' @param dsc the column name that will be used as the first description component.
#' @param dsc2 the column name that will be used as the second description component.
#' @param smr_col text color for the summary component. Defaults to 'white'.
#' @param smr_bgcol background-color for the summary component. Defaults to "#002240".
#' @param dsc_col text color for the first description component. Defaults to "#1D1D1D".
#' @param dsc_bgcol background-color for the first description component. Defaults to "#FFFFFF".
#' @param dsc_size font size of the first description component. Defaults to "14px".
#' @param dsc2_col text color for the second description component. Defaults to "#3AD900".
#' @param dsc2_bgcol background-color for the second description component. Defaults to "#FFFFFF".
#' @param dsc2_size font size of the second description component. Defaults to "14px".
#' @return A Vertical HTML Time Line Widget with 2 Description Levels
#' @export
#'



create_tml_2 <- function(df,
                       smr,
                       dsc,
                       dsc2,
                       smr_col = "white",
                       smr_bgcol =  "#002240",
                       dsc_col = "#1D1D1D",
                       dsc_bgcol = "#FFFFFF",
                       dsc_size = "14px",
                       dsc2_col = "#1D1D1D",
                       dsc2_bgcol = "#FFFFFF",
                       dsc2_size = "14px") {

  if (any(!is.character(smr),
          !is.character(dsc),
          !is.character(dsc2),
          !is.character(smr_col),
          !is.character(smr_bgcol),
          !is.character(dsc_col),
          !is.character(dsc_bgcol),
          !is.character(dsc_size),
          !is.character(dsc2_col),
          !is.character(dsc2_bgcol),
          !is.character(dsc2_size))) {


    stop("All parameters except 'df' must be provided as a character string ! you're not in Tidyverse !!!")

  }


  if(any(!c(smr, dsc, dsc2) %in% names(df))) {

    stop(glue::glue(

      "Please check the columns' names.

      Note that they need to be provided as a character string in this form:

      (df = mtcars, smr = 'mpg', dsc = 'wt', dsc2 = 'hp')

      "

    ))

  }


  htmltools::tagList(

    cronologia_dependency(),

    timeline2(df,
              smr,
              dsc,
              dsc2,
              smr_col,
              smr_bgcol,
              dsc_col,
              dsc_bgcol,
              dsc_size,
              dsc2_col,
              dsc2_bgcol,
              dsc2_size)

  )

}


