#' Standardized difference interpretation
#'
#' Interpretation of indices using different sets of rules of thumb.
#' [Click here](https://easystats.github.io/report/articles/interpret_metrics.html#standardized-difference-d-cohens-d) for details.
#'
#'
#' @param d,g,delta Value or vector of effect size values.
#' @param rules Can be `"funder2019"` (default), `"gignac2016"`, `"cohen1988"`, `"sawilowsky2009"` or custom set of [rules()].
#'
#'
#'
#' @examples
#' interpret_d(.02)
#' interpret_d(c(.5, .02))
#'
#' @references
#' - Funder, D. C., & Ozer, D. J. (2019). Evaluating effect size in psychological research: sense and nonsense. Advances in Methods and Practices in Psychological Science.
#' - Gignac, G. E., & Szodorai, E. T. (2016). Effect size guidelines for individual differences researchers. Personality and individual differences, 102, 74-78.
#' - Cohen, J. (1988). Statistical power analysis for the behavioural sciences.
#' - Sawilowsky, S. S. (2009). New effect size rules of thumb.
#'
#' @export
interpret_d <- function(d, rules = "funder2019") {
  if (is.rules(rules)) {
    return(interpret(abs(d), rules))
  } else {
    if (rules == "funder2019") {
      return(interpret(d_to_r(abs(d)), rules(c(0.05, 0.1, 0.2, 0.3, 0.4), c("tiny", "very small", "small", "medium", "large", "very large"))))
    } else if (rules == "gignac2016") {
      return(interpret(abs(d), rules(c(0.2, 0.4, 0.6), c("very small", "small", "medium", "large"))))
    } else if (rules == "cohen1988") {
      return(interpret(abs(d), rules(c(0.2, 0.5, 0.8), c("very small", "small", "medium", "large"))))
    } else if (rules == "sawilowsky2009") {
      return(interpret(abs(d), rules(c(0.1, 0.2, 0.5, 0.8, 1.2, 2), c("tiny", "very small", "small", "medium", "large", "very large", "huge"))))
    } else {
      stop("rules must be 'funder2019', 'gignac2016','cohen1988', 'sawilowsky2009' or an object of type rules.")
    }
  }
}

#' @rdname interpret_d
#' @export
interpret_g <- function(g, rules = "funder2019") {
  interpret_d(g, rules)
}

#' @rdname interpret_d
#' @export
interpret_delta <- function(delta, rules = "funder2019") {
  interpret_d(delta, rules)
}
