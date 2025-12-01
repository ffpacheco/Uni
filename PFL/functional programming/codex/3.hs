divprop :: Integer -> [Integer]
divprop n = [x | x <- [1.. div n 2], mod n x == 0]

binom :: Integer -> Integer -> Integer
binom n k = div (product[1..n])  (product[1..k] * product[1..n-k])

pascal :: Integer -> [[Integer]]
pascal n = [ [binom x y | y <- [0..x]] | x <- [0..n]]

myand :: [Bool] -> Bool
myand [] = True
myand (x:xs)
    | x == False = False
    | x == True = myand xs

myor :: [Bool] -> Bool
myor [] = False
myor (x:xs)
    | x == True = True
    | x == False = myor xs

forte :: String -> Bool
forte s = length s >=8 && any upper s && any lower s && any num s

upper :: Char -> Bool
upper s = s >= 'A' && s<= 'Z'

lower :: Char -> Bool
lower s = s >= 'a' && s<= 'z'

num :: Char -> Bool
num s = s >= '0' && s<= '9'

intersperse :: a -> [a] -> [a]
intersperse x [] = []
intersperse x [a] = [a]
intersperse a (x:xs) = [x] ++ [a] ++ intersperse a xs
