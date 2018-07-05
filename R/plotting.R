#' Plot rotor occupancy
#' 
#' @param df Data.frame with columns
#' - x: x-coordinate (numeric)
#' - y: y-coordinate (numeric)
#' - occupied (optional): boolean
#' if the `occupied` column is missing, all positions will be considered empty.
#' @param size Scalar numeric, symbol size
#' @param text_size Scalar numeric, text size
#' @importFrom ggplot2 ggplot aes theme geom_point element_blank
#' scale_fill_manual theme_minimal geom_text coord_polar ylim
#' @export
#' @examples
#' df <- calculate_positions(30)
#' df$occupied <- FALSE
#' df[c(1, 11, 14, 15, 21, 29, 30), "occupied"] <- TRUE
#' plot_rotor(df)
plot_rotor <- function(df, radius = 1, size = 10, text_size = 5) {
  if(!hasName(df, "occupied")) {
    df$occupied <- "Empty"
  } else {
    df$occupied <- ifelse(df$occupied, "Occupied", "Empty")
  }
  df$occupied <- factor(df$occupied, levels = c("Empty", "Occupied"))
  df$r <- radius
  ggplot2::ggplot(
    data = df, 
    ggplot2::aes(x = factor(n), y = radius, label = n, fill = occupied)) +
    ggplot2::geom_point(shape = 21, color = "darkgrey", size = size,
                        stroke = 2) +
    ggplot2::geom_text(color = "white", size = text_size) +
    ggplot2::scale_fill_manual(
      values = c("Occupied" = "navy", "Empty" = "grey"),
      name = "", drop = FALSE) +
    ggplot2::coord_polar(theta = "x") +
    ggplot2::ylim(0, 1) +
    ggplot2::theme_minimal(14) +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      legend.position = "none",
      axis.text = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank())
}
