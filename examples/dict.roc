app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.14.0/dC5ceT962N_4jmoyoffVdphJ_4GlW3YMhAPyGPr-nU0.tar.br" }

import pf.Stdout

# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.
twoSum :
    List I64,
    I64
    -> List U64
twoSum = \nums, target ->
    map = Dict.empty {}
    res = List.walkWithIndexUntil
        nums
        { map, idx: [] }
        \acc, x, i1 ->
            when Dict.get acc.map (target - x) is
                Ok i2 -> Break { map: acc.map, idx: [i1, i2] }
                Err _ -> Continue { map: Dict.insert acc.map x i1, idx: acc.idx }
    res.idx

main =
    twoSum [3, 2, 4] 6
        |> List.map Num.toStr
        |> Str.joinWith ","
        |> Stdout.line!

expect twoSum [3, 2, 4] 6 == [2, 1]
expect twoSum [2, 7, 11, 15] 9 == [1, 0]
expect twoSum [3, 3] 6 == [1, 0]
