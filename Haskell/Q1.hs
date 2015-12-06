----------------------------------------------------------------------------
-- Assignment Haskel: Question 1 - 713221, 710990, 713231 - Group No. 3
----------------------------------------------------------------------------
average ::  [Float] -> Float 
-- Creates a Float type list then outputs a Float
average xs = sum xs / 3
-- Adds all elements in the list then divides them by 3
--
howManyAboveAverage :: [Int]-> [Int]
-- Creates an Int type list then outputs an Int type list
howManyAboveAverage xs = filter (>average) xs
-- Takes in the elements in the list and prints all elements that are 
-- greater than the average.
                  where average  = sum xs `div` length xs
-- Calculates the average of all elements in the list by adding all
-- elements in the list then dividing the sum by the length of the list
-- Tests
--
-- *Main> average [713231, 710990, 713221]
-- 712480.7
-- *Main> howManyAboveAverage [713231, 710990, 713221]
-- [713231,713221]