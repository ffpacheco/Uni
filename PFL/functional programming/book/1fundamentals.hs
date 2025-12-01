--Implement myMinimum, which, similarly to Prelude’s minimum, returns the smallest element of a list.
myMinimum :: Ord a => [a] -> a
myMinimum [x] = x
myMinimum (x:xs) = min x (myMinimum xs)

--Implement mySum, which, similarly to Prelude’s sum, compute the sum of the elements in a list of integers
mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x:xs) = x + mySum xs

--Implement myProduct, which, similarly to Prelude’s product, compute the product of the elements in a list of integers
myProduct :: Num a => [a] -> a
myProduct [] = 1
myProduct (x:xs) = x * myProduct xs

--Implement myAnd, which, similarly to Prelude’s and, computes the logical conjunction of a list of booleans.
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

--Implement myOr, which, similarly to Prelude’s or, computes the logical disjunction of a list of booleans
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

--Implement the scalarProduct, which computes the scalar product between two lists X and Y with the same length n, using the formula
scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct [] [] = 0
scalarProduct (x:xs) (y:ys)= x * y + scalarProduct xs ys

--Implement myMaximum, which, similarly to Prelude’s maximum, given a list, returns the largest element of a list
myMaximum :: Ord a => [a] -> a
myMaximum [x] = x
myMaximum (x:xs) = max x (myMaximum xs)

--Implement myElem, which, similarly to Prelude’s elem, returns a boolean indicating if an element belongs to a list.
myElem :: Eq a => a -> [a] -> Bool
myElem a [] = False
myElem a (x:xs)
        | a == x = True
        | otherwise = myElem a xs

--Implement nth1, which, given an integer n and a list l, returns the n-th element
nthl :: Int -> [b] -> b
nthl a x
    | a > length x = error "INDEX OUT OF RANGE"
    |otherwise = head (drop (a-1) x)

--Implement seq22, which, given an integer n, creates a sequence of length n with the structure [1,2,2,...,2,1] (1 followed by a series of 2’s and ending with a 1).
seq22 :: Num a => Int -> [a]
seq22 1 = [1]
seq22 0 = []
seq22 n = [1] ++ replicate (n-2) 2 ++ [1]
