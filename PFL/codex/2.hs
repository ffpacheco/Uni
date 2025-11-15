classifica :: Float -> Float -> String
classifica p h
    | p/(h*h) <18.5 = "baixo peso"
    | p/(h*h) < 25 = "peso normal"
    | p/(h*h) <30 = "excesso de peso"
    | otherwise = "obesidade"

max3 :: Int -> Int -> Int -> Int
max3 a b c
    | a>=b && a>=c = a
    | c>=b && c>=b = c
    | otherwise =b

xor :: Bool -> Bool -> Bool
xor a b
    | a && (not b)  == True = True
    | b && (not a)  == True = True
    | otherwise = False

mediana :: Int -> Int -> Int -> Int
mediana a b c = a + b + c - minimum [a,b,c] - maximum [a,b,c]
