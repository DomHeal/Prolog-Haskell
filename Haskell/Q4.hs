----------------------------------------------------------------------------
-- Assignment Haskel: Question 4 - 713221, 710990, 713231 - Group No. 3
----------------------------------------------------------------------------
import Data.Char
--
countInts1 :: [Char] -> Int
countInts1 b = length [c | c <- b, isDigit c]
-- Using List comprehension we check each elements if it contains a digit
-- if it does, it is then pass on and we can get the length of the digits
-- For Example
-- Enter ['1','e','5','w','1']
-- it will output an Integer: 3
-- 
--
countInts3 :: [Char] -> Int
countInts3 z = foldl (\n y -> n+1) 0 (filter isDigit z)
-- Using the foldl and filter functions with isDigit
-- For Example
-- Enter ['1','e','2']
-- it will remove all elements which is not a digit
-- It will Output an Integer: 2
-- 