#' Plot EDA Results (Boxplots)
#'
#' @description Plots text length and word count for rumor vs. non-rumor messages.
#'
#' @param x An object of class 'eda_result', created by runEDA().
#' @param ... Additional arguments (currently unused).
#'
#' @return Boxplots are displayed in the plot window.
#' @examples
#' eda <- runEDA(data.frame(text = c("Fake?", "This is fine."), is_rumor = c(1, 0)))
#' plot(eda)
plot.eda_result <- function(x, ...) {
  stopifnot(inherits(x, "eda_result"))
  df <- x$data

  p1 <- ggplot(df, aes(x = label, y = text_length, fill = label)) +
    geom_boxplot() +
    theme_minimal() +
    labs(title = "Text Length by Rumor Label", x = "", y = "Characters") +
    theme(legend.position = "none")

  p2 <- ggplot(df, aes(x = label, y = word_count, fill = label)) +
    geom_boxplot() +
    theme_minimal() +
    labs(title = "Word Count by Rumor Label", x = "", y = "Words") +
    theme(legend.position = "none")

  print(p1)
  print(p2)
}
