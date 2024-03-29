#' Summary Method for S3 Objects of Class `D3mirt`
#'
#' @description The summary method for the [D3mirt::D3mirt()] function.
#' @param object A S3 object of class `D3mirt`.
#' @param ... Additional arguments.
#' @param digits The number of digits shown per estimate. The default is `digits = 4`.
#'
#' @return Tables containing \emph{a} and \emph{d} parameters, multidimensional discrimination (MDISC), multidimensional item difficulty (MDIFF), direction cosines, and degrees for vector angles for items.
#' If constructs were used in the estimation process, the summary function will also show tables for direction cosines, and degrees for construct vectors as well as directional discrimination (DDISC) parameters.
#'
#' @author Erik Forsberg
#' @examples
#' \dontrun{
#' # Call D3mirt() and create list of constructs
#' # The first argument can be data frame with model parameters
#' # or an S4 object of class 'SingleGroupClass' exported from mirt::mirt
#' c <- list(list(1,2,3,4,5,6,7,8,9,10),
#'           list(11,12,13,14),
#'           list(15,17,18,19,20))
#' g <- D3mirt(mod1, c)
#'
#' # Call to summary
#' summary(g)
#'
#' #' # Call to summary rounded off to 2 digits
#' summary(g, digits = 2)
#' }
#' @export
summary.D3mirt <- function(object, ..., digits = 4){
  tab1 <- as.data.frame(object$loadings)
  tab2 <- as.data.frame(object$diff)
  tab1 <- as.data.frame(cbind(tab1, tab2))
  tab3 <- as.data.frame(object$mdiff)
  tab4 <- as.data.frame(object$mdisc)
  tab4 <- as.data.frame(cbind(tab4, tab3))
  tab5 <- as.data.frame(cbind(object$dir.cos, object$spherical))
  if (!is.null(object$c.dir.cos)){
    tab6 <- as.data.frame(cbind(object$c.dir.cos, object$c.spherical))
    tab7 <- as.data.frame(cbind(object$ddisc))
    cat(paste("\nD3mirt:", nrow(tab1), "items and", ncol(tab2), "levels of difficulty\n\n"))
    cat(paste("Constructs:\n"))
    for (i in seq_along(object$c)){
      n <- unlist(object$c[i])
      z <- sapply(n, function (x){
        q <- as.character(rownames(tab1[x,]))
      })
      cat(paste("Vector ", i, ": ", paste(z, collapse=", "), "\n", sep = ""))
    }
    cat(paste("\n"))
  } else {
    cat(paste("\nD3mirt:", nrow(tab1), "items and", ncol(tab2), "levels of difficulty\n\n"))
  }
  if (!is.null(object$c.dir.cos)){
    print(round(tab1,digits))
    cat(paste("\n"))
    print(round(tab4,digits))
    cat(paste("\n"))
    print(round(tab5, digits))
    cat(paste("\n"))
    print(round(tab6, digits))
    cat(paste("\n"))
    print(round(tab7, digits))
  } else{
    print(round(tab1,digits))
    cat(paste("\n"))
    print(round(tab4,digits))
    cat(paste("\n"))
    print(round(tab5, digits))
  }
}
