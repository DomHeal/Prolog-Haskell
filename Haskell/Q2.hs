----------------------------------------------------------------------------
-- Assignment Haskel: Question 5 - 713221, 710990, 713231 - Group No. 3
----------------------------------------------------------------------------


pizza :: Int -> Int -> Float

-- This works out the total for cost of toppings and cost of base. Had to use fromIntegral to convert to Float.
pizza topping basesize = ((areaofbase * fromIntegral topping) * 0.002) + (areaofbase * 0.0025)	
	where 	areaofbase = (((fromIntegral basesize/2)^2) * pi) -- working out area of pizza (pi/r^2)
			
-- Pizza Bambini costs £2.23
-- Pizza Famiglia costs £5.22
-- Therefore Pizza Famiglia costs more.