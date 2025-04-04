#' Count Words in a Text Vector
#'
#' @description This simple utility function returns the number of words in each message.
#'
#' @param text A character vector containing messages or sentences.
#'
#' @return A numeric vector with word counts.
#' @examples
#' countWords(c("How are you?", "This is R."))
countWords <- function(text) {
  stopifnot(is.character(text))
  word_counts <- sapply(strsplit(text, "\\s+"), length)
  return(word_counts)
}
