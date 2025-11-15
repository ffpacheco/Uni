algarismos :: Int -> [Int]
algarismos n
    | n <=0 = []
    | otherwise =  algarismos (div n 10) ++[mod n 10]

toBits :: Int -> [Int]
toBits n
    | n <=0 = []
    | otherwise = toBits (div n 2) ++ [mod n 2]

fromBits :: [Int] -> Int
fromBits [] = 0
fromBits (x:xs) = x * (2 ^ length xs) + fromBits xs

insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs)
    |n<=x = [n] ++ [x] ++ xs
    | otherwise = [x] ++ insert n xs

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs )

merge :: Ord a => [a] -> [a] -> [a]
merge [] x = x
merge [] [] = []
merge x [] = x
merge (x:xs) (y:ys)
    | x<=y = [x] ++ merge xs (y:ys)
    | otherwise = [y] ++ merge (x:xs) ys
