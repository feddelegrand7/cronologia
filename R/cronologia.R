

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
                     dsc_bgcol) {


    k <- df[[smr]]

    s <- df[[dsc]]

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

                  "color: {dsc_col}; background: {dsc_bgcol};"

                )

                )
            )
          )
        )
    }

    r <- mapply(func, k, s, SIMPLIFY = FALSE)

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
#' @return
#' @export
#'
#' if(interactive()) {











#'}
#'
#' @examples


create_timeline <- function(df,
                            smr,
                            dsc,
                            smr_col = "white",
                            smr_bgcol =  "#002240",
                            dsc_col = "#1D1D1D",
                            dsc_bgcol = "#FFFFFF"
                            ) {


  htmltools::tagList(

    cronologia_dependency(),

    timeline(df,
             smr,
             dsc,
             smr_col,
             smr_bgcol,
             dsc_col,
             dsc_bgcol)

  )

}
