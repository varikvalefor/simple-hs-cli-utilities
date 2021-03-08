import Control.Monad;
import System.Environment;

pwd :: IO ();
pwd = getEnvironment >>= \env ->
  putStrLn $ snd $ filter ((== "PWD") . fst) env !! 0;

cat :: IO ();
cat = getArgs >>= mapM_ (readFile >=> putStr);

whoami :: IO ();
whoami = getEnvironment >>= putStrLn . snd . (!!0) .
  filter ((== "USER") . fst);

decidePrg :: String -> IO ();
decidePrg x | x == "pwd" = pwd
            | x == "cat" = cat
            | x == "whoami" = whoami

main :: IO ();
main = getProgName >>= decidePrg;
