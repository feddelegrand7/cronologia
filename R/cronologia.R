

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


#' Create a Vertical Time Line
#'
#' @param df a data frame containing the necessary information
#' @param smr the column that will be used as the summary component
#' @param dsc the column that will be used as the description component
#' @param smr_col text color for the summary component. Defaults to 'white'
#' @param smr_bgcol background-color for the summary component. Defaults to "#002240"
#' @param dsc_col text color for the description component. Defaults to "#1D1D1D"
#' @param dsc_bgcol background-color for the description component. Defaults to "#FFFFFF"
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

          htmltools::tags$br(),


          htmltools::tags$img(
            src = n,
            alt = m,
            height = imgheight,
            width = imgwidth
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




#' Title
#'
#' @param df
#' @param smr
#' @param dsc
#' @param imgsrc
#' @param imgalt
#' @param smr_col
#' @param smr_bgcol
#' @param dsc_col
#' @param dsc_bgcol
#' @param imgheight
#' @param imgwidth
#'
#' @return
#' @export
#'
#' @examples


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
             imgheight = imgheight,
             imgwidth = imgwidth)

  )

}
