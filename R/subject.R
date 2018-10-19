#' Extract subject-specific information
#'
#' @param x an object of class \code{"LongitudinalData"}
#' @param id_num the specific subject id that you select
#'
#' @return an object of class \code{"subject"}
#' @export
#'
#' @importFrom dplyr group_by summarise
#' @importFrom tidyr spread
#' @import readr
#' @examples
#' \dontrun{
#'
#' out = subject(x,54)
#' print(out)
#'
#' out_summary= subject(x,54) %>% summary
#' print(out_summary)
#' }
subject = function(x, id_num){
  class(x)= "data.frame"
  sel_id = which(x$id==id_num)
  sel_dat = x[sel_id,]
  class(sel_dat) = "subject"
  return(sel_dat)
}

#' @export
print.subject = function(x,...){
  if (length(x$id)!= 0){
    id_num = unique(x$id)
    paste("Subject ID:", id_num)}
  else{
    NULL
  }
}

#' @export
summary.subject = function(object,...){
  class(object) = "data.frame"
  out0 = object %>% group_by(visit,room) %>% summarise(val = mean(value))
  out1 = spread(out0,room,val)
  out2= list(id=unique(object$id),summ_result= out1)
  class(out2) = "summ"
  return(out2)
}

#' @export
print.summ = function(x,...){
  cat(paste("ID:",(x$id),"\n"))
  (as.data.frame(x$summ_result))
}
