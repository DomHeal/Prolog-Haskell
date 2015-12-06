----------------------------------------------------------------------------
-- Assignment Haskel: Question 5 - 713221, 710990, 713231 - Group No. 3
----------------------------------------------------------------------------

divides :: Integer -> Integer -> Bool
divides x y = y `mod` x == 0

prime :: Integer -> Bool
prime n = n > 1 && and [not(divides x n) | x <- [2..(n-1)]]


allprimes :: [Integer]
allprimes = [x | x<- [2..], prime x]

----------------------------------------------------------------------------
-- Part a
----------------------------------------------------------------------------
allprimesBetween :: Integer -> Integer -> [Integer] -- this returns all prime numbers between two integers
allprimesBetween x y = [z | z<- [x..y], prime z]

----------------------------------------------------------------------------
-- Part b
----------------------------------------------------------------------------
primeTest :: [Bool] -- This returns a list of booleans. True if prime number, False if not.
primeTest = [primeTestaux (x) | x <- [0..]]

primeTestaux :: Integer -> Bool -- This check is n is a prime number or not.
primeTestaux  n =  n > 1 && and [not(divides x n) | x <- [2..(n-1)]]

----------------------------------------------------------------------------
-- Part c
---------------------------------------------------------------------------- 
--primeTest2 :: ([Integer] , [Bool])
--primeTest2 = (allprimes2,[primeTestaux (x) | x <- [0..]])

--primeTestaux2 :: Integer -> Bool
--primeTestaux2  n =  n > 1 && and [not(divides x n) | x <- [2..(n-1)]]

--allprimes2 :: [Integer]
--allprimes2 = [x | x<- [2..], prime x]

----------------------------------------------------------------------------
-- Part d
----------------------------------------------------------------------------

listofnumbers n (x:xs) =  -- This is an algorithm which stops searching through the list. Currently set to
							-- and infinite set.
	if n < xs 				
		then False 
		else if n == x 
			then True 
			else listofnumbers n xs 

primeTwin n = (listofnumbers (n+2) allprimes) || (listofnumbers (n-2) allprimes) -- this checks if the current prime number
																				 -- has another prime number either +2 or -2
																				 -- relative to the current prime numbers value.

listofprimetwin = filter primeTwin allprimes -- this produces a list of prime twin numbers but filters out any irrelenvant prime numbers
