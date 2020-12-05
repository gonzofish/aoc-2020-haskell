import qualified Data.List as List
import System.Environment

main = do
  [file, target] <- getArgs
  contents <- readFile file
  putStrLn . show . compute . findNums (read target :: Int) . split $ convertInput contents

convertInput :: String -> [Int]
convertInput = map readInt . lines

readInt :: String -> Int
readInt value = read value :: Int

split :: [Int] -> ([Int], [Int])
split numbers = (lower, List.reverse upper)
  where
    mid = div (length numbers) 2
    (lower, upper) = splitAt mid $ List.sort numbers

findNums :: Int -> ([Int], [Int]) -> (Int, Int)
findNums _ ([], []) = (0, 0)
findNums target (lower, []) = findNums target (split lower)
findNums target ([], upper) = findNums target (split upper)
findNums target (lower, upper)
  | sum == target = (lowerHead, upperHead)
  | sum < target = findNums target (lowerTail, upper)
  | sum > target = findNums target (lower, upperTail)
  where
    (lowerHead : lowerTail) = lower
    (upperHead : upperTail) = upper
    sum = lowerHead + upperHead

compute :: (Int, Int) -> Int
compute (lower, upper) = lower * upper
