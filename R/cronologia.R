

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

timeline <- function(df, smr, dsc) {


    k <- df[[smr]]

    s <- df[[dsc]]

    func <- function(i, j) {


        htmltools::tagList(
          htmltools::div(
            class = "detail-wrapper",

            htmltools::tags$details(

              htmltools::tags$summary(i),

              htmltools::tags$p(j)
            )
          )
        )
    }

    r <- mapply(func, k, s, SIMPLIFY = FALSE)

    return(

      htmltools::tagList(
        htmltools::div(class = "wrapper", r)
      )
    )


}


create_timeline <- function(df, smr, dsc) {


  htmltools::tagList(

    cronologia_dependency(),

    timeline(df, smr, dsc)

  )

}
