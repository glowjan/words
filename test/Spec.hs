import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "How to write test" $ do
        it "Should be able to run tests" $ do
            someText `shouldBe`  "someFunc"
