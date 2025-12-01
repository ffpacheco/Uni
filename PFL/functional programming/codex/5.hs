import Prelude hiding ((++))
import Prelude hiding (reverse)
import Prelude hiding (zipWith)

primo :: Integer -> Bool
primo n
    | n <= 1 = False
    | otherwise = not (any (\x -> mod n x ==0) [2 .. floor (sqrt (fromIntegral n))])

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr f z lista
    where f     = (:)
          z     = ys
          lista = xs

reverse :: [a] -> [a]
reverse xs = foldr f z xs
    where f a b = b ++ [a]
          z     = []

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f xs ys =
    foldr step base xs ys
  where
    step x rec (b:bs) = f x b : rec bs
    step a b []       = []
    base a            = []

palavras :: String -> [String]
palavras [] = []
palavras str =
    let str_ = dropWhile (==' ') str
    in if null str_ then []
    else
        let (w, rest) = span (/= ' ') str_
        in w : palavras rest

nums :: [Double]
nums = cycle [4,-4]

denums :: [Double]
denums = [1,3..]

termos :: [Double]
termos= zipWith (/) nums denums

aproxPi1, aproxPi2 :: Int -> Double
aproxPi1 0 = 0
aproxPi1 n = sum (take n termos)

denums2 :: [Double]
denums2 = [x*(x+1)*(x+2) | x <- [2,4..]]

termos2 :: [Double]
termos2 = zipWith (/) nums denums2

aproxPi2 n = 3 + sum (take (n-1) termos2)

pascal :: [[Integer]]
pascal = [[ div (product [1..n])  ( product[1..k] * product[1..(n-k)]) | k<- [0..n]]| n <- [0..]]

primos :: [Integer]
primos = filter primo [2..]

primo :: Integer -> Bool
primo n
    | n < 2     = False
    | otherwise = not (any (\x -> mod n x == 0) [2..floor (sqrt (fromIntegral n))])

goldbach :: Integer -> (Integer, Integer)
goldbach n = head [(x, n-x) | x<- primos, primo (n-x) ]
