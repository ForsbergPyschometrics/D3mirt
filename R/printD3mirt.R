#' Print Method for S3 Objects of Class `D3mirt`
#'
#' @description The print method for the [D3mirt::D3mirt()] function.
#' @param x A S3 object of class `D3mirt`.
#' @param ... Additional arguments.
#'
#' @return A printed message reporting the number of items, levels of difficulty, the number of construct vectors and the row names of the respective items contained in each construct.
#' @author Erik Forsberg
#'
#' @examples
#' \dontrun{
#' # Call D3mirt()
#' # The first argument can be data frame with model parameters
#' # or an S4 object of class 'SingleGroupClass' exported from mirt::mirt
#' g <- D3mirt(mod1)
#'
#' # Print model summary
#' print(g)
#' }
#' @export
print.D3mirt <- function(x, ...){
  tab1 <- as.data.frame(x$loadings)
  tab2 <- as.data.frame(x$diff)
  tab1 <- as.data.frame(cbind(tab1, tab2))
  if (length(x$diff) > 1){
    cat(paste("\nD3mirt:", nrow(tab1), "items and", length(tab2), "levels of difficulty\n\n"))
    } else {
    cat(paste("\nD3mirt:", nrow(tab1), "items and", length(tab2), "level of difficulty\n\n"))
    }
  if (length(x$modid) == 2 ){
    cat(paste("Compensatory model\n"))
    cat(paste("Model identification items: ", paste(x$modid[1],", ", sep = ""), paste (x$modid[2], sep = "") , "\n\n", sep = ""))
  }
  if (length(x$modid) > 2 ){
    cat(paste("Orthogonal model\n"))
    for (i in seq_along(x$modid)){
      n <- unlist(x$modid[i])
      z <- as.character(rownames(tab1[n, ]))
      cat(paste("Item vector ", i, ": ", paste(z, collapse=", ", sep = ""), "\n", sep = ""))
    }
  }
    if (!is.null(x$con.items)){
    cat(paste("Constructs\n"))
    for (i in seq_along(x$con.items)){
      n <- unlist(x$con.items[i])
      z <- as.character(rownames(tab1[n, ]))
        cat(paste("Item vector ", i, ": ", paste(z, collapse=", ", sep = ""), "\n", sep = ""))
  }
  }
   if (!is.null(x$con.sphe)){
      cat(paste("Constructs\n"))
      for (i in seq_along(x$con.sphe)){
        n <- unlist(x$con.sphe[i])
          cat(paste("Spherical coordinate vector ", i, ": ", paste(n[1], ", ", collapse="", sep = ""), paste(n[2], collapse="", sep = ""), "\n", sep = ""))
      }
  }
  cat(paste("\n"))
}
