module Lib
    ( formatGrid,
      outputGrid,
      findWordInLine,
      findWord,
      findWords,
      skew
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

skew :: Grid -> Grid
skew [] = []
skew (h : t) = h : skew (map indent t)
    where indent line = '_' : line

getLines :: Grid -> [String]
getLines grid = let horizontal = grid
                    vertical = transpose horizontal
                    diagonal = diagonalize grid ++ diagonalize (reverse grid)
                    lines = vertical ++ horizontal ++ diagonal
                in  lines ++ map reverse lines

diagonalize :: Grid -> Grid
diagonalize = transpose . skew

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf
