#' Plot EDA Results (Boxplots)
#'
#' @description Plots text length and word count for rumor vs. non-rumor messages.
#' @param x An object of class 'eda_result', created by runEDA().
#' @param ... Additional arguments (currently unused).
#' @return A combined plot of two ggplot2 boxplots.
#' @export
#' @examples
#' eda <- runEDA(data.frame(text = c("Fake?", "This is fine."), is_rumor = c(1, 0)))
#' plot(eda)

plot.eda_result <- function(x, ...) {
  stopifnot(inherits(x, "eda_result"))
  df <- x$data

  p1 <- ggplot2::ggplot(df, ggplot2::aes(x = label, y = text_length, fill = label)) +
    ggplot2::geom_boxplot() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Text Length by Rumor Label", x = "", y = "Characters") +
    ggplot2::theme(legend.position = "none")

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x = label, y = word_count, fill = label)) +
    ggplot2::geom_boxplot() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Word Count by Rumor Label", x = "", y = "Words") +
    ggplot2::theme(legend.position = "none")

  gridExtra::grid.arrange(p1, p2, ncol = 2)
}
