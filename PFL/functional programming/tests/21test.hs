maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs)
    | x > next = x
    | otherwise = next
    where
        next = maxpos xs

dups :: [a] -> [a]
dups [] = []
dups [x] = [x]
dups (x:y:zs )= x:x:y:zs
