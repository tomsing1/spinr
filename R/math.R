#' Calculate the angle for a position in the rotor
#' 
#' @param N Scalar integer, the number of total positions in the rotor.
#' @importFrom checkmate assert_count
#' @return Numeric vector with circular angles (theta) for all integers <= N.
#' @export
#' @examples
#' calculate_tube_angle(32)
calculate_tube_angle <- function(N) {
  checkmate::assert_count(N)
  n = seq.int(N)
  (n - 1) * 2 * pi / N
}


#' Calculate the x and y coordinates for a tube based on its angle
#' 
#' @param theta Numeric vector, the rotational angle(s) (theta)
#' @importFrom checkmate assert_numeric
#' @return Data.frame with one row for each element of `r` and columns
#' - x: x-coordinate
#' - y: y-coordinate
#' @export
#' @examples
#' theta <- calculate_tube_angle(32)
#' calculate_tube_coordinate(theta)
calculate_tube_coordinate <- function(theta) {
  checkmate::assert_numeric(theta)
  data.frame(
    x = cos(theta), 
    y = sin(theta)
  )
}

#' Calculate tube coordinates and angles
#' 
#' @inheritParams calculate_tube_angle
#' @return Data.frame with one row for each element of `r` and columns
#' - n: position, as provided by the user
#' - theta: angle
#' - x: x-coordinate
#' - y: y-coordinate
#' @export
#' @examples 
#' calculate_positions(32)
calculate_positions <- function(N) {
  theta <- calculate_tube_angle(N)
  positions <- calculate_tube_coordinate(theta)
  data.frame(
    n = seq.int(N),
    theta = theta,
    positions
  )
}

#' Determine whether a rotor is balanced
#' 
#' @param df Data.frame with columns
#' - x: x-coordinate (numeric)
#' - y: y-coordinate (numeric)
#' - occupied: boolean
#' @importFrom checkmate assert_names
#' @export
#' @return Scalar boolean
#' df <- calculate_positions(30)
#' df$occupied <- FALSE
#' df[c(1, 11, 14, 15, 21, 29, 30), "occupied"] <- TRUE
#' is_balanced(df)  # TRUE
#' df[29, "occupied"] <- TRUE
#' is_balanced(df)  # FALSE
is_balanced <- function(df, tolerance = 1e-3) {
  checkmate::assert_names(colnames(df), must.include = c("x", "y", "occupied"))
  checkmate::assert_numeric(df$x)
  checkmate::assert_numeric(df$y)
  checkmate::assert_logical(df$occupied)
  balanced <- all.equal(
    c(sum(df[df$occupied, "x"]), sum(df[df$occupied, "y"])),
    c(0L, 0L),
    tolerance = tolerance)
  return(balanced == TRUE)
}
