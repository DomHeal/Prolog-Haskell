----------------------------------------------------------------------------
-- Assignment Haskel: Question 3 - 713221, 710990, 713231 - Group No. 3
----------------------------------------------------------------------------
-- Producing a List for testing
myList=[[1,2,3],[1,2],[5]]
--
elementsInList :: [[a]] -> [Int]
elementsInList = map length
testElements = map length myList
-- Takes in a List inside a List
-- For Example
-- elementsInList [[1,2,3],[1,2],[5]]
-- and gets the length of each list inside that list which outputs:
-- [3,2,1]
--
minElementsInList :: [[Int]] -> [Int]
minElementsInList = map minimum
testMinElements = map minimum myList
-- Takes In a List inside a List
-- For Example
-- minElementsInList [[1,2,3],[1,2],[5]]
-- and gets the minimum value of each list inside that list which outputs:
-- [1,1,5]
--