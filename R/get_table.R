#' @title Get data from airtable
#'
#' @description
#' \code{get_table} is a function used to prepare data.frame from a selected table
#' in a specific airtable Base.
#'
#' @usage
#' get_table(API, base, table)
#'
#' @param API character. API key for the airtable account.
#'
#' @param base character. ID of the selected base.
#'
#' @param table character. Name of the table in the base.
#'
#' @details This function uses the credentials to call airtable API and then
#' assembles the resulting data.frame using \code{rawToChar} and \code{jsonlite::fromJSON()}.
#'
#' @return Returns a data.frame
#'
#' @author Adela Pavelkova & Michal Kubista
#'
#' @examples
#' \dontrun{
#' get_table('APIKEY', 'BASEID', 'TABLENAME')
#' }
#' @export
get_table <- function(API, base, table) {

    GET(paste0('https://api.airtable.com/v0/', base ,'/', table, '?api_key=', API)) %>%
    .$content %>%
    rawToChar() %>%
    fromJSON() %>%
    .$records %>%
    .$fields %>%
    return()

}
