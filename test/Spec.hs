import Test.Hspec
import Lib
import Data

main :: IO ()
main = hspec $ do
    describe "findWordInLine" $ do
        it "Should find word 'auto' in word 'automitve'" $ do
            (findWordInLine "auto" "automotive") `shouldBe`  True
        it "Should not find word 'auto' in word 'car'" $ do
            (findWordInLine "auto" "car") `shouldBe`  False

    describe "findWord" $ do
        it "Should find word written from left to right" $ do
            (findWord grid "HASKELL" ) `shouldBe`  True
        it "Should find word written from right to left" $ do
            (findWord grid "PERL" ) `shouldBe`  True
        it "Should find word written top down" $ do
            (findWord grid "CSHARP" ) `shouldBe`  True
        it "Should find word written bottom up" $ do
            (findWord grid "LISP" ) `shouldBe`  True
        it "Should find word written diagonal from top left" $ do
            (findWord grid "RUBY" ) `shouldBe`  True
        it "Should find word written diagonal from bottom left" $ do
            (findWord grid "COBOL" ) `shouldBe`  True
        it "Should find word written diagonal from bottom right" $ do
            (findWord grid "BASIC" ) `shouldBe`  True
        it "Should find word written diagonal from top right" $ do
            (findWord grid "SCHEME" ) `shouldBe`  True
        it "Should not find word not existing" $ do
            (findWord  grid "JAVA") `shouldBe`  False

    describe "findWords" $ do
        it "Should find word written from left to right" $ do
            (findWords grid ["HASKELL","JAVA","PERL"] ) `shouldBe`  ["HASKELL", "PERL"]
        it "Should find word written from left to right" $ do
            (findWords grid ["HASKELL","JAVA","CSHARP"] ) `shouldBe`  ["HASKELL", "CSHARP"]
        it "Should find all languages" $ do
                    (findWords grid languages ) `shouldBe`  languages
