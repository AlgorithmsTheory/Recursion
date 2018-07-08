import Data.List  

sNext [a] = [a + 1]

c a _ = [a]

u num arg = [arg !! (num -1)]

s (a:f) arg = superPos a f arg 

superPos a f arg = a $ map (\x -> (x arg) !! 0) f

summ arg = [foldr (+) 0 arg]

mul [] = [0]
mul arg = [foldr (*) 1 arg] 

pow (arg1:arg2:xs) = [arg1 ^ arg2]

recursion1 q f arg | arg == [0] = [q]
                   | otherwise = recursionHelper1 f [q, 1] (arg !! 0)

recursionHelper1 f arg reach | arg !! 1 == reach = f arg
                             | otherwise = recursionHelper1 f [ (f arg) !! 0 ,(arg !! 1) + 1] reach

recursion q f (arg1:args) | arg1 == 0 = q args
                          | otherwise = recursionHelper f ((q args !! 0):1:args) arg1

recursionHelper f (fpred:arg1:args) reach | arg1 == reach = f (fpred:arg1:args)
                                          | otherwise = recursionHelper f (((f (fpred:arg1:args)) !! 0):(arg1 + 1):args) reach

infix 5 |-|
a |-| b = if a > b then a - b else 0

fac :: Integer -> Integer
fac 0 = 0
fac 1 = 1
fac n = n * fac (n - 1)