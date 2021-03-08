import Control.Monad;
import System.Environment;

pwd :: IO ();
pwd = getEnvironment >>= \env ->
  putStrLn $ snd $ filter ((== "PWD") . fst) env !! 0;

decidePrg :: String -> IO ();
decidePrg x | x == "pwd" = pwd

main :: IO ();
main = getProgName >>= decidePrg;
