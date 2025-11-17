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

index :: [a] -> Int -> a
index x 0 = head x
index x n = index (drop 1 x) (n-1)

elem_ :: Eq a => a -> [a] -> Bool
elem_ n [] = False
elem_ n (x:xs)
    | n == x = True
    | otherwise = elem_ n xs

leastDiv :: Integer -> Integer
leastDiv n = let res= [x | x<- [2..(floor(sqrt(fromIntegral n) ))], mod n x == 0]
             in if null res then n else head res

isPrimeFast :: Integer -> Bool
isPrimeFast n
    | n<=1 = False
    | leastDiv n == n = True
    | otherwise = False

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x: nub (removeEx x xs)

removeEx :: Eq a => a -> [a] -> [a]
removeEx n [] = []
removeEx n (y:ys)
    | n == y = removeEx n ys
    | otherwise = y: removeEx n ys

intersperse :: a -> [a] -> [a]
intersperse n [] = []
intersperse n [a] = [a]
intersperse n (x:xs) = x:n: intersperse n xs

insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs)
    | n <= x = (n : x : xs)
    | otherwise = x : insert n xs

isort :: Ord a => [a] -> [a]
isort [] = []
isort [a] = [a]
isort (x:xs) = insert x (isort xs)

merge :: Ord a => [a] -> [a] -> [a]
merge [] a = a
merge a [] = a
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | y <= x = y : merge (x:xs) ys

toBits :: Int -> [Int]
toBits n = reverse (aux n)

aux :: Int ->[ Int]
aux 0 = []
aux n = [mod n 2] ++ aux (div n 2)

fromBits :: [Int] -> Int
fromBits x = fromBitsAux 0 x

fromBitsAux :: Int -> [Int] -> Int
fromBitsAux n [] = n
fromBitsAux n (x:xs) = fromBitsAux(n * 2 + x) xs

divisors :: Integer -> [Integer]
divisors n = filter (\x -> mod n x == 0 ) [1..n]

isPrimeFast_ :: Integer -> Bool
isPrimeFast_ n = not (any (\x -> mod n x == 0) [2..floor(sqrt (fromIntegral n))])

myappend :: [a] -> [a] -> [a]
myappend xs ys = foldr (:) ys xs

myconcat :: [[a]] -> [a]
myconcat ys = foldr (++) [] ys

myreverse :: [a] -> [a]
myreverse xs = foldl (\y x -> x : y) [] xs

myelem ::  Eq a => a -> [a] -> Bool
myelem n xs = foldr (\x acc-> if (n == x) || acc then True else False) False xs

sndfromBits :: [Int] -> Int
sndfromBits xs = foldl (\acc x -> acc * 2 + x) 0 xs

group :: Eq a => [a] -> [[a]]
group [] = []
group (x:xs) =
    let ys = takeWhile (==x) xs
        zs = dropWhile (==x) xs
    in (x:ys) : group zs

intercalate :: a -> [a] -> [[a]]
intercalate n [] = [[n]]
intercalate n (x:xs) = (n : x : xs) : [x : zs | zs <- intercalate n xs]

permutations :: Eq a => [a] -> [[a]]
permutations [] = [[]]
permutations (x:xs) = concat [ intercalate x p | p <- permutations xs ]
