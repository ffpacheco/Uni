testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a + b > c) && (a + c > b) && (b + c > a)

areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt ( s * (s-a) * (s-b) * (s-c))
    where s = (a+b+c)/2

binom :: Integer -> Integer -> Integer
binom n k = div (product[1..n])  (product[1..k] * product[1..n-k])
