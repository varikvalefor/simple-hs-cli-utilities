import Control.Monad;
import System.Environment;
import Data.List;

pwd :: IO ();
pwd = getEnvironment >>=
  putStrLn . snd . (!! 0) . filter ((== "PWD") . fst);

cat :: IO ();
cat = getArgs >>= mapM_ (readFile >=> putStr);

whoami :: IO ();
whoami = getEnvironment >>= putStrLn . snd . (!!0) .
  filter ((== "USER") . fst);

wc :: IO ();
wc = getArgs >>= mapM_ (readFile >=> print . length . words);

echo :: IO ();
echo = getArgs >>= putStrLn . foldr (++) [] . intersperse " ";

env :: IO ();
env = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);

decidePrg :: String -> IO ();
decidePrg x | x == "whoami" = whoami
            | x == "echo" = echo
            | x == "cat" = cat
            | x == "env" = env
            | x == "pwd" = pwd
            | x == "wc" = wc

main :: IO ();
main = getProgName >>= decidePrg;
