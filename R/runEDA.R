#' Run Exploratory Data Analysis on Rumor Dataset
#'
#' @description This function analyzes the message text and calculates:
#' number of characters, number of words, and number of question marks.
#' It returns a structured object with results and metadata.
#'
#' @param data A data.frame with columns 'text' and 'is_rumor'.
#' @param simplify Logical. If TRUE (default), it cleans and converts input types.
#'
#' @return An S3 object of class 'eda_result', including a cleaned data frame and summary stats.
#' @examples
#' runEDA(data.frame(text = c("Is this true?", "No."), is_rumor = c(1, 0)))
runEDA <- function(data, simplify = TRUE) {
  stopifnot(is.data.frame(data))
  stopifnot("text" %in% names(data), "is_rumor" %in% names(data))

  df <- data
  if (simplify) {
    df$text <- as.character(df$text)
    df$is_rumor <- as.integer(ifelse(is.na(df$is_rumor), 0, df$is_rumor))
  }

  df$text_length <- nchar(df$text)
  df$word_count <- sapply(strsplit(df$text, "\\s+"), length)
  df$question_marks <- sapply(gregexpr("\\?", df$text), function(x) sum(x > 0))
  df$label <- ifelse(df$is_rumor == 1, "Rumor", "Not Rumor")

  result <- list(
    data = df,
    n_obs = nrow(df),
    n_rumor = sum(df$is_rumor == 1),
    n_non_rumor = sum(df$is_rumor == 0)
  )

  attr(result, "created") <- Sys.time()
  attr(result, "source") <- "Your dataset"
  class(result) <- "eda_result"

  return(result)
}
