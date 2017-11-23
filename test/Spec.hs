import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "Searching for words in line" $ do
        it "Should find word 'auto' in word 'automitve'" $ do
            (findWordInLine "auto" "automotive") `shouldBe`  True
        it "Should not find word 'auto' in word 'car'" $ do
            (findWordInLine "auto" "car") `shouldBe`  False

    describe "Searching for words in grid" $ do
        it "Should find word written from left to right" $ do
            (findWord grid "HASKELL" ) `shouldBe`  True
        it "Should find word written from right to left" $ do
            (findWord grid "PERL" ) `shouldBe`  True
        it "Should not find word not existing" $ do
            (findWord  grid "JAVA") `shouldBe`  False
