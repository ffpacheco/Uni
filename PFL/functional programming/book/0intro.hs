--Implement five, which returns the string "five" if its sole argument is equal to 5, and "not five" otherwise.
five :: (Eq a, Num a) => a -> [Char]
five x | x == 5 = "five"
       | otherwise= "not five"

--Implement the min3 function, that returns the smallest element of the three arguments.
min3 :: Ord a => a -> a -> a -> a
min3 a b c
    | a <= b && a <= c = a
    | b <= a && b <= c = b
    | otherwise = c

testPh :: (Ord a, Floating a) => a -> [Char]
testPh p
    | p == 7 = "neutral"
    | p > 7 = "basic"
    | otherwise = "acid"

--Implement the factorial function that computes the product of an integer n by all the numbers between 1 and n.
factorial :: (Ord p, Num p) => p -> p
factorial 0 = 1
factorial n = n * factorial (n-1)

--Implement the myGcd function, which computes the greatest common divisor of two integers.
myGcd :: Integral a => a -> a -> a
myGcd a b
    | b==0 = abs a
    | otherwise = myGcd b (mod a b)

--Implement the mPower function that computes the nth power of m, mn, where m is a real number and n is an integer. Note: n can be negative.
mPower :: ( Fractional a, Integral t) => a -> t -> a
mPower m n
    | n == 0 = 1
    | n > 0 = m * mPower m (n-1)
    | n < 0 = - m * mPower m (abs n -1)

--Implement fib which computes the nth number of the Fibonacci sequence (n >= 0).
fib :: (Num a, Ord a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

--Implement the ackermann function, which implements the Ackermann function
ackermann :: (Num a, Ord a, Num t, Ord t) => a -> t -> t
ackermann m n
        | m == 0 = n + 1
        | m > 0 && n == 0 = ackermann (m - 1) 1
        | m > 0 && n > 0 = ackermann (m-1)( ackermann m (n-1))

--Implement pascal, which computes the value on the nth row and kth column of the Pascal triangle
pascal :: (Num a, Ord a, Num p) => a -> a -> p
pascal k n
        | k == 0 = 1
        | k == n = 1
        | 0 < k && k < n = pascal (k-1) (n-1) + pascal k (n-1)
        | otherwise = error "NOT VALID"

--Implement isPrime which returns a boolean indicating whether a positive integer is a prime number or not
isPrime :: Integral t => t -> Bool
isPrime n
    | length (mults n) == 2 = True
    | otherwise = False

mults :: Integral t => t -> [t]
mults n = [x | x <- [1..n], mod n x == 0]
