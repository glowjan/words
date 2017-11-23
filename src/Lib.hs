module Lib
    ( formatGrid,
      outputGrid,
      grid,
      languages,
      findWordInLine,
      findWord,
      findWords
    ) where

import Data.List (isInfixOf, transpose)

type Grid = [String]

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn $ formatGrid grid

formatGrid :: Grid -> String
formatGrid = unlines

findWords :: Grid -> [String] -> [String]
findWords grid languages = filter (findWord grid) languages

findWord :: Grid -> String -> Bool
findWord grid word = or $ map (findWordInLine word) (getLines grid)

getLines :: Grid -> [String]
getLines grid = let horizontal = grid
                    vertical = transpose horizontal
                    lines = vertical ++ horizontal
                in  lines ++ map reverse lines

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

grid = [ "__C________R___"
       , "__SI________U__"
       , "__HASKELL____B_"
       , "__A__A_____S__Y"
       , "__R___B___C____"
       , "__PHP____H_____"
       , "____S_LREP_____"
       , "____I__M_Y__L__"
       , "____L_E__T_O___"
       , "_________HB____"
       , "_________O_____"
       , "________CN_____"
       ]

languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ]