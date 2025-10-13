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

hamming_ :: [Integer]
hamming_ = 1: merge m2 (merge m3 m5)
    where
        m2=map(2*) hamming_
        m3=map(3*) hamming_
        m5=map(5*) hamming_
