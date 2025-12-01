paragraphs :: String -> [String]
paragraphs "" = []
paragraphs s = takeWhileStr s : (paragraphs (dropWhileStr s))

takeWhileStr :: String -> String
takeWhileStr "" = []
takeWhileStr [a] = [a]
takeWhileStr (a:b:cs)
    | a == '\n' && b == '\n' = []
    | otherwise = a:takeWhileStr (b:cs)

dropWhileStr :: String -> String
dropWhileStr "" = []
dropWhileStr [a] = []
dropWhileStr (a:b:cs)
    | a == '\n' && b == '\n' = cs
    | otherwise = dropWhileStr(b:cs)

fillWords :: Int -> [String] -> [[String]]
fillWords _ [] = []
fillWords max ws =
    let (line, rest) = splitAt (wordsThatFit max ws) ws
    in line : fillWords max rest

wordsThatFit :: Int -> [String] -> Int
wordsThatFit _ [] = 0
wordsThatFit max (w:ws)
    | length w > max = 0
    | otherwise = countWords (length w) ws 1
            where
                countWords :: Int -> [String] -> Int -> Int
                countWords _ [] acc = acc
                countWords used (x:xs) acc
                    | used + 1 + length x <= max = countWords (used + 1 + length x) xs (acc + 1)
                    | otherwise = acc 
