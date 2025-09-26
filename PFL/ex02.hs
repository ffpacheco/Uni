classify :: Int -> String
classify x = if x>= 19 then "excelent"
             else if x>=16 then "very good"
             else if x>=13 then "good"
             else if x>=10 then "passed"
             else "failed"

classify_ :: Int -> String
classify_ x | x>= 19    = "excelent"
            | x>= 16    = "very good"
            | x>= 13    = "good"
            | x>= 10    = "passed"
            | otherwise = "failed"

classifyBMI :: Float -> Float -> String
classifyBMI weight height
    |bmi >=30   = "obese"
    |bmi >=25   = "overweight"
    |bmi >=18.5 = "normal weight"
    |otherwise  = "underweight"
    where bmi = weight/ (height * height)

max3, min3 :: Ord a => a -> a -> a -> a

max3 a b c  | a>=b && a>=c   = a
            | b>=a && b>=c   = b
            | otherwise   = c

min3 a b c  | a<=b && a<=c   = a
            | b<=a && b<=c   = b
            | otherwise   = c

max3_, min3_ :: Ord a => a -> a -> a -> a

max3_ a b c = max a (max b c)

min3_ a b c = min a (min b c)

xor :: Bool -> Bool -> Bool
xor True True = False
xor True False = True
xor False True = True
xor False False = False

safetail :: [a] -> [a]
safetail x = if length x == 0 then []
             else drop 1 x

safetail_ :: [a] -> [a]
safetail_ x | length x == 0   = []
            | otherwise = drop 1 x

safetail' :: [a] -> [a]
safetail' [] = []
safetail' x = drop 1 x

short :: [a] -> Bool
short x | length x < 3 = True
        | otherwise = False

short_ :: [a] -> Bool
short_ [] = True
short_ [_] = True
short_ [_,_] = True
short_ (_:_:_) = False

median :: Int -> Int -> Int -> Int
median a b c |a>b && a<c || a>c && a<b  = a
             |b>a && b<c || b>c && b<a  = b
             |otherwise = c

median_ :: Int -> Int -> Int -> Int
median_ a b c = a + b + c - max3 a b c - min3 a b c
