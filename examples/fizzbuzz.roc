app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.14.0/dC5ceT962N_4jmoyoffVdphJ_4GlW3YMhAPyGPr-nU0.tar.br" }

import pf.Stdout

# Print the integers from 1 to 100, replacing multiples of three with "Fizz",
# multiples of five with "Buzz", and multiples of both three and five with "FizzBuzz".

fizzBuzz = \i ->
    if i % 3 == 0 && i % 5 == 0 then
        "FizzBuzz"
    else if i % 3 == 0 then
        "Fizz"
    else if i % 5 == 0 then
        "Buzz"
    else
        Num.toStr i

main =
    List.range { start: At 0, end: At 100 }
        |> List.map fizzBuzz
        |> Str.joinWith "\n"
        |> Stdout.line!

## Test Case 1: not a multiple of 3 or 5
expect fizzBuzz 1 == "1"
expect fizzBuzz 7 == "7"

## Test Case 2: multiple of 3
expect fizzBuzz 3 == "Fizz"
expect fizzBuzz 9 == "Fizz"

## Test Case 3: multiple of 5
expect fizzBuzz 5 == "Buzz"
expect fizzBuzz 20 == "Buzz"

## Test Case 4: multiple of both 3 and 5
expect fizzBuzz 15 == "FizzBuzz"
expect fizzBuzz 45 == "FizzBuzz"
