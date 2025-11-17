import Data.Char

fours :: [Double]
fours = cycle[4.0,-4.0]

denomins :: [Double]
denomins = [1.0,3.0..]

calcPi1 :: Int -> Double
calcPi1 n = sum(take n pi1nums)

pi1nums :: [Double]
pi1nums = zipWith (/) fours denomins

denominadores :: [Double]
denominadores = [x * (x+1) * (x+2) | x<- [2,4..]]

calcPi2 :: Int -> Double
calcPi2 n = 3 + sum(take n pi2nums)

pi2nums :: [Double]
pi2nums = zipWith (/) fours denominadores

primes :: [Integer]
primes = sieve [2..]

sieve :: [Integer] -> [Integer]
sieve (p:xs) = p : sieve [x | x<-xs, mod x p/=0]

twinPrimes :: [(Integer,Integer)]
twinPrimes =  filter istwin consecutivePrimes

consecutivePrimes :: [(Integer,Integer)]
consecutivePrimes = zip primes (tail primes)

istwin :: (Integer,Integer) -> Bool
istwin (a,b) =  a == b-2

hammingaux :: Int -> [Integer]
hammingaux n = [2^i*3^j*5^k | i<-[0..n], j<-[0..n], k<-[0..n], i+j+k == n]

hamming :: Int -> [Integer]
hamming n = concat[ hammingaux x | x <- [0..n]]

merge :: [Integer] -> [Integer] -> [Integer]
merge [] a = a
merge a [] = a
merge (x:xs) (y:ys) | x < y = x : merge xs (y:ys)
                    | x > y = y : merge (x:xs) ys
                    | otherwise = x : merge ys xs

sndhamming :: [Integer]
sndhamming = 1 : merge (map (*2) sndhamming)(merge (map (*3) sndhamming)(map (*5) sndhamming))

rot13 :: Char -> Char
rot13 c
    | 'a' <= c && c <= 'z' = chr (ord 'a' + mod (ord c - ord 'a' + 13) 26)
    | 'A' <= c && c <= 'Z' = chr (ord 'A' + mod (ord c - ord 'A' + 13) 26)
    | otherwise = c

wordsThatFit :: Int -> [String] -> Int
wordsThatFit n [] = 0
wordsThatFit max (w:ws)
    | length w > max = 0
    | otherwise = countWords (length w) ws 1
            where
                countWords :: Int -> [String] -> Int -> Int
                countWords n [] acc = acc
                countWords used (x:xs) acc
                    | used + 1 + length x <= max = countWords (used + 1 + length x) xs (acc + 1)
                    | otherwise = acc

fillWords :: Int -> [String] -> [[String]]
fillWords n [] = []
fillWords n (x:xs) =
    let (line, rest) = splitAt (wordsThatFit max ws) ws
    in line : fillWords max rest
