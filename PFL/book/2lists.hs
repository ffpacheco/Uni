--Implement myReverse, which, similarly to Prelude’s reverse, given a list, returns a new list with its elements in reverse order.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs ) ++ [x]

--Implement conseqPairs that receives a list l and returns a list of pairs of consecutive elements in l.
conseqPairs :: [a] -> [(a,a)]
conseqPairs [] = []
conseqPairs [a] = []
conseqPairs (a:b:cs) = [(a,b)] ++ conseqPairs (b:cs)

--Implement deleteOne, which, similarly to Data.List’s delete, given a value v and a list l, removes the first occurrence of v in l
deleteOne :: Eq a => a -> [a] -> [a]
deleteOne a [] = []
deleteOne a (x:xs)
        | a == x = xs
        | otherwise = x : deleteOne a xs

--Implement deleteAll, which, given a value v and a list l, removes all occurrences of v in l.
deleteAll :: Eq a => a -> [a] -> [a]
deleteAll a [] = []
deleteAll a (x:xs)
        | a == x = deleteAll a xs
        | otherwise = x : deleteAll a xs

--Implement myConcat, which, similarly to Prelude’s concat, concatenates all of the sublists of a list of lists.
myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ myConcat xs

--Implement myReplicate, which, similarly to Prelude’s replicate, creates a list with the length given by the first argument and the items having the value of the second argument.
myReplicate :: Int -> a -> [a]
myReplicate 0 a = []
myReplicate n a = [a] ++ myReplicate (n-1) a

--Implement myCycle, which, similarly to Prelude’s cycle, creates an infinite list where the input list is concatenated to itself an infinite number of times
myCycle :: [a] -> [a]
myCycle [] = []
myCycle x = x ++ myCycle x

--Implement myIntersperse, which, similarly to Data.List’s intersperse, takes an element v and a list l and adds v between consecutive elements of l
myIntersperse :: Char -> String -> String
myIntersperse a [] = []
myIntersperse a [x] = [x]
myIntersperse a (x:xs) = x : a : myIntersperse a xs

--Implement myTake, which, similarly to Prelude’s take, given a positive integer n and a list l, returns the first n elements of l. If there are fewer than n elements, then it returns l.
myTake :: Int -> [a] -> [a]
myTake n (x:xs)
        | n == 0 = []
        | otherwise = [x] ++ myTake (n-1) xs

--Implement myDrop, which, similarly to Prelude’s drop, given a positive integer n and a list l, removes the first n elements from l.
myDrop :: Int -> [a] -> [a]
myDrop n [] = []
myDrop n (x:xs)
        | n == 0 = (x:xs)
        | otherwise = myDrop (n-1) xs

--Implement mySplitAt, which, similarly to Prelude’s splitAt, given an integer n and a list l, returns a pair where the first element contains the first n elements of l and the second one contains the remaining elements of l
mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt n []     = ([], [])
mySplitAt 0 xs     = ([], xs)
mySplitAt n (x:xs) = (x : fst (mySplitAt (n - 1) xs), snd (mySplitAt (n - 1) xs))

--Implement myGroup, which, similarly to Data.List’s group, splits its list argument into a list of lists of equal, adjacent elements
myGroup :: Eq a => [a] -> [[a]]
myGroup []     = []
myGroup (x:xs) = (x : takeSame x xs) : myGroup (dropSame x xs)

takeSame :: Eq a => a -> [a] -> [a]
takeSame _ [] = []
takeSame v (y:ys)
    | v == y    = y : takeSame v ys
    | otherwise = []

dropSame :: Eq a => a -> [a] -> [a]
dropSame _ [] = []
dropSame v (y:ys)
    | v == y    = dropSame v ys
    | otherwise = (y:ys)

--Implement myZip, which, similarly to Prelude’s zip, returns a list of pairs containing the elements of both input lists occurring at the same positions.
myZip :: [a] -> [b] -> [(a,b)]
myZip [] xs = []
myZip xs [] = []
myZip (y:ys) (x:xs) = [(y,x)] ++ myZip ys xs

--Implement myZip3, which, similarly to Prelude’s zip3, returns a list of triples containing the elements of the three input lists occurring at the same positions.
myZip3 :: [a] -> [b]-> [c] -> [(a, b, c)]
myZip3 xs [] [] = []
myZip3 xs ys [] = []
myZip3 xs [] ys = []
myZip3 [] xs [] = []
myZip3 [] xs ys = []
myZip3 [] [] xs = []
myZip3 (x:xs) (y:ys) (z:zs) = [(x,y,z)] ++ myZip3 xs ys zs

--Implement myNub which, similarly to List.Data’s nub, removes duplicates from the input list by only keeping the first occurrence of each distinct element.
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (x:xs) = x:myNub (removeAll x xs)

removeAll :: Eq a => a -> [a] -> [a]
removeAll a [] = []
removeAll a (x:xs)
        | a == x = removeAll a xs
        | otherwise = x: removeAll a (xs)

--Implement iSort which sorts a list using the insertion sort algorithm.
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert a (x:xs) =
        | a<= x = a : x : xs
        | otherwise = insert a xs

iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort (x:xs) =insert x (iSort xs)

--Implement sSort which sorts a list using the selection sort algorithm
sSort :: Ord a => [a] -> [a]
sSort [] = []
sSort xs = fst (removeMin xs) : sSort (snd (removeMin xs))

removeMin :: Ord a => [a] -> (a, [a])
removeMin [x] = (x, [])
removeMin (x:xs) =
    if x <= fst (removeMin xs) then (x, xs)
    else (fst (removeMin xs), x : snd (removeMin xs))

--Implement mSort which sorts a list using the merge sort algorithm
mSort :: Ord a => [a] -> [a]
mSort [] = []
mSort [x] = [x]
mSort xs = merge (mSort left) (mSort right)
        where (left, right) = splitAt (div (length xs) 2) xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
        | x <= y    = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys

--Implement qSort which sorts a list using the quicksort algorithm
qSort :: Ord a => [a] -> [a]
qSort [] = []
qSort (x:xs) = qSort [y | y <- xs, y <= x] ++ [x] ++ qSort [y | y <- xs, y > x]
