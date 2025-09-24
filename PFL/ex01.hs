incr :: Int -> Int
incr x = x+1

triple :: Int -> Int
triple x = 3*x

welcome :: String -> String
welcome name = "Hello, " ++ name ++ "!"

count :: String -> String
count str = show (length str) ++ " characters."

leftHalf :: [x] -> [x]
leftHalf x = take (div (length x) 2 ) x

rightHalf :: [x] -> [x]
rightHalf x = drop (div (length x) 2 ) x

second :: [x] -> x
second x = head(drop 1 x)

lastMem :: [x] -> x
lastMem x = head(reverse x)

lastMem_ :: [x] -> x
lastMem_ x = head(drop (length x - 1) x)

removeLast :: [x] -> [x]
removeLast x = reverse(drop 1 (reverse(x)))

removeLast_ :: [x] -> [x]
removeLast_ x = take (length x -1) x

middleMem :: [x] -> x
middleMem x = head(drop (div(length x)  2) x)

checkPalindrome :: String -> Bool
checkPalindrome x = x == reverse(x)

checkTriangle :: Float -> Float -> Float -> Bool
checkTriangle a b c = (a + b > c) && (a + c > b) && (b + c > a)

triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = sqrt(s*(s-a)*(s-b)*(s-c))
    where s = (a + b + c)/2
