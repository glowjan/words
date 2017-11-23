module Lib
    ( someFunc,
      someText
    ) where

someFunc :: IO ()
someFunc = putStrLn someText
someText = "someFunc"