# Define the programming challenges
challenges <- list(
  list(
    description = "Create a function that takes two arguments and returns their sum.",
    test_cases = list(
      list(args = list(1, 2), expected_output = 3),
      list(args = list(3, 5), expected_output = 8),
      list(args = list(-2, 7), expected_output = 5)
    )
  ),
  list(
    description = "Create a function that takes a list of numbers and returns the highest value.",
    test_cases = list(
      list(args = list(1, 2, 3), expected_output = 3),
      list(args = list(10, -5, 8, 2), expected_output = 10),
      list(args = list(0, 0, 0), expected_output = 0)
    )
  ),
  list(
    description = "Create a function that takes a string and returns the number of vowels.",
    test_cases = list(
      list(args = list("hello world"), expected_output = 3),
      list(args = list("aeiou"), expected_output = 5),
      list(args = list("abcdefghijklmnopqrstuvwxyz"), expected_output = 5)
    )
  )
)

# Define the player's starting level and score
level <- 1
score <- 0

# Define a function to display the programming challenge
display_challenge <- function(challenge) {
  cat(paste0("\nChallenge:\n", challenge$description, "\n\n"))
}

# Define a function to test the player's solution
test_solution <- function(solution, test_cases) {
  for (test_case in test_cases) {
    args <- test_case$args
    expected_output <- test_case$expected_output
    actual_output <- do.call(solution, args)
    if (actual_output != expected_output) {
      return(FALSE)
    }
  }
  return(TRUE)
}

# Define a function to run the game
run_game <- function() {
  cat("Welcome to the programming simulator!\n\n")
  while (level <= length(challenges)) {
    challenge <- challenges[[level]]
    display_challenge(challenge)
    solution <- readline("Enter your solution: ")
    if (test_solution(parse(text = solution)[[1]], challenge$test_cases)) {
      cat("Congratulations, you passed the challenge!\n")
      score <- score + 1
      level <- level + 1
    } else {
      cat("Sorry, your solution did not pass the test cases.\n")
    }
    cat(paste0("\nYour score: ", score, "\n"))
  }
  cat("Congratulations, you completed all the challenges!\n")
}

# Run the game
run_game()
