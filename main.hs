import Control.Monad;
import System.Environment;

pwd :: IO ();
pwd = getEnvironment >>= \env ->
  putStrLn $ snd $ filter ((== "PWD") . fst) env !! 0;

cat :: IO ();
cat = getArgs >>= mapM_ (readFile >=> putStr);

decidePrg :: String -> IO ();
decidePrg x | x == "pwd" = pwd
            | x == "cat" = cat

main :: IO ();
main = getProgName >>= decidePrg;
