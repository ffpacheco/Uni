import Data.Char (chr, ord)
main1 :: IO ()
main1 = do
    txt <- getContents
    print (length (lines txt))
    print (length (words txt))
    print (length txt)

main2 :: IO ()
main2 = do
    txt <- getContents
    let lns = lines txt
    putStrLn (unlines (map reverse lns))

main :: IO ()
main = interact (map rot13)

rot13 :: Char -> Char
rot13 c
    | 'a' <= c && c <= 'z' = chr (ord 'a' + (ord c - ord 'a' + 13) `mod` 26)
    | 'A' <= c && c <= 'Z' = chr (ord 'A' + (ord c - ord 'A' + 13) `mod` 26)
    | otherwise            = c
