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
wc = getArgs >>= mapM_ (readFile >=> putStrLn . show . length . words);

echo :: IO ();
echo = getArgs >>= putStrLn . foldr (++) [] . intersperse " ";

env :: IO ();
env = getEnvironment >>= mapM_ (\a -> putStrLn $ fst a ++ "=" ++ snd a);

decidePrg :: String -> IO ();
decidePrg x | x == "pwd" = pwd
            | x == "cat" = cat
            | x == "env" = env
            | x == "whoami" = whoami
            | x == "wc" = wc
            | x == "echo" = echo

main :: IO ();
main = getProgName >>= decidePrg;
