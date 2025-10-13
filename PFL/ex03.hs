and_ :: [Bool] -> Bool
and_ [] = True
and_ (x:xs) = x && and_ xs

or_ :: [Bool] -> Bool
or_ [] = False
or_ (x:xs) = x || or_ xs

concat_ :: [[a]] -> [a]
concat_ [] = []
concat_ (x:xs) = x ++ concat_ xs

replicate_ :: Int -> a -> [a]
replicate_ n x  | n<=0 = []
                | otherwise = x:replicate_ (n-1) x

myIndex_ :: [a] -> Int -> a
myIndex_ x 0 = head x
myIndex_ x n = myIndex_ (drop 1 x) (n-1)

elem_ :: Eq a => a -> [a] -> Bool
elem_ a [] = False
elem_ a (x:xs)  |x == a = True
                | otherwise = elem_ a xs

leastDiv :: Integer -> Integer
leastDiv a  = aux a 2
    where
    aux :: Integer -> Integer -> Integer
    aux n d
        | d*d > n = n
        | mod n d == 0 = d
        | otherwise = aux n (d+1)

isPrimeFast :: Integer -> Bool
isPrimeFast n | n <= 1 = False
            | leastDiv n == n = True
            | otherwise = False

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub (filter (\y -> y /= x) xs)

intersperse_ :: a -> [a] -> [a]
intersperse_ n [] = []
intersperse_ n [a] = [a]
intersperse_ n (x:xs) = x : n : intersperse_ n xs

insert :: Ord a => a-> [a] -> [a]
insert n [] = [n]
insert n (x:xs) | n <= x = n : x : xs
                | otherwise = x : insert n xs

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

merge :: Ord a =>[a] ->[a] -> [a]
merge [] y = y
merge x [] = x
merge (x:xs) (y:ys) |x<= y = x:merge xs (y:ys)
                    |y< x = y:merge (x:xs) ys

msort :: Ord a =>[a] ->[a]
msort [] = []
msort [a] = [a]
msort xs = merge (msort left) (msort right)
    where
    mid= div (length xs) 2
    left = take mid xs
    right = drop mid xs

toBits :: Int -> [Int]
toBits n = reverse (toBitsaux n)

toBitsaux :: Int -> [Int]
toBitsaux 0 = []
toBitsaux x = (mod x 2) : toBitsaux (div x 2)

fromBits :: [Int] -> Int
fromBits x = fromBitsAux 0 x

fromBitsAux :: Int -> [Int] -> Int
fromBitsAux n [] = n
fromBitsAux n (x:xs) = fromBitsAux(n * 2 + x) xs

divisors :: Integer -> [Integer]
divisors n = filter (\x -> mod n x == 0)[1..n]

isPrimeFast_ :: Integer -> Bool
isPrimeFast_
