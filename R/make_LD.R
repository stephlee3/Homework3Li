
#' Create a new class for longitudinal data
#'
#' @param dat a data frame which collected over times on a given subject/person at multiple visits and locations.
#'
#' @return returns a list with class \code{"LongitudinalData"} containing the following variables: id, visit, room, value and timepoint.
#'
#' @export
#' @import readr
#' @examples
#' library(readr)
#' mie <- read_csv("D:/2018_1st_term/stats_computing/hw/hw3/MIE.csv.gz", col_types = "iicdi")
#' x = make_LD(mie)
#' class(x)
#' print(x)
#'
make_LD = function(dat){
  structure(dat, class = "LongitudinalData")
}

#' @export
print.LongitudinalData= function(x,...){
  sub_num = length(unique((x$id)))
  cat(paste("longitudinal dataset with",sub_num,"subjects"))
}
