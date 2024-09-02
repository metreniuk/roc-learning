app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.14.0/dC5ceT962N_4jmoyoffVdphJ_4GlW3YMhAPyGPr-nU0.tar.br" }

import pf.Stdout
import pf.Task

stoplight = \count ->
    if count > 0 then
        Green
    else if count == 0 then
        Yellow
    else
        Red

stoplightToStr = \tag ->
    when tag is
        Green -> "green"
        Yellow -> "yellow"
        Red -> "red"

main =
    stoplight -1
        |> stoplightToStr
        |>
        Stdout.line!
