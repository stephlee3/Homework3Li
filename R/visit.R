#' Extract visit-specific information
#'
#' @param x an object of class \code{"LongitudinalData"}
#' @param visit_num the specific visit that you select
#'
#' @return an object of class \code{"visit"}
#' @export
#' @import readr
#'
#' @examples
#'
#'\dontrun{
#' out_idv = subject(x,44)%>%visit(0)
#' print(out_idv)
#'}
#'
#'
#'
visit = function(x,visit_num){
  class(x) = "data.frame"
  sel_id= which(x$visit==visit_num)
  sel_dat = x[sel_id,]
  class(sel_dat) = "visit"
  return(sel_dat)
}

#' @export
print.visit = function(x,...){
  id.u = unique(x$id)
  if (length(id.u)==1){
    cat(paste("ID:",id.u),"\n")
  }

  visit.u = unique(x$visit)
  if (length(visit.u)==1){
    cat(paste("Visit:",visit.u),"\n")
  }
}
