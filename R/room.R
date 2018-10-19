#' Extract room-specific information
#'
#' @param x an object of class \code{"LongitudinalData"}
#' @param room_name  the specific room that you select
#'
#' @return an object of class \code{"room"}
#' @import dplyr
#' @import readr
#' @export
#'
#' @examples
#' \dontrun{
#'
#' out_idvr= subject(x, 44) %>% visit(0) %>% room("bedroom")
#' print(out_idvr)
#'
#' out_sum1 <- subject(x, 44) %>% visit(0) %>% room("bedroom") %>% summary
#' print(out_sum1)
#'
#' out_summary <- subject(x, 44) %>% visit(1) %>% room("living room") %>% summary
#' print(out_summary)
#'}
room = function(x,room_name){
  class(x) = "data.frame"
  sel_id= which(x$room==room_name)
  sel_dat = x[sel_id,]
  class(sel_dat) = "room"
  return(sel_dat)
}

#' @export
print.room = function(x,...){
  id.u = unique(x$id)
  if (length(id.u)==1){
    cat(paste("ID:",id.u),"\n")
  }

  visit.u = unique(x$visit)
  if (length(visit.u)==1){
    cat(paste("Visit:",visit.u),"\n")
  }

  room.u = unique(x$room)
  if (length(room.u)==1){
    cat(paste("Room:",room.u),"\n")
  }
  if (length(id.u)==0 | length(visit.u)==0 | length(room.u)==0){
    NULL
  }
}


#' @export
summary.room = function(object,...){
  class(object)="data.frame"
  val = object$value
  a= list(id=unique(object$id),summ_result= summary(val))
  class(a) = "idvrsumm"
  return(a)
}
#' @export
print.idvrsumm = function(x,...){
  cat(paste("ID:",(x$id),"\n"))
  (x$summ_result)
}

