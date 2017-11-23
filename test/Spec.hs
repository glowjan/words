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
        it "Should find word 'auto' in grid 'automitve','car'" $ do
            (findWord ["automotive","car"] "auto" ) `shouldBe`  True
        it "Should not find word 'auto' in grid 'car','train','robot'" $ do
            (findWord  ["car","train","robot"] "auto") `shouldBe`  False