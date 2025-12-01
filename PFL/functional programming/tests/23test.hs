type Species = (String, Int)
type Zoo = [Species]

isEndangered :: Species -> Bool
isEndangered (name, count) = count <=100

updateSpecies :: Species -> Int -> Species
updateSpecies (name, count) newborns = (name , count+newborns)

filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] func = []
filterSpecies (sp: sps) func
    | (func sp) = [sp] ++ filterSpecies sps func
    | otherwise = filterSpecies sps func

countAnimals :: Zoo -> Int
countAnimals animais = sum(map(\(name, count) -> count) animais)

substring :: (Integral a) => String -> a -> a -> String
substring str i k = [ str !! ind | ind <- [(fromIntegral i)..(fromIntegral k)] ]

hasSubstr :: String -> String -> Bool
hasSubstr original sub = hasSubstraux original sub ""

hasSubstraux :: String -> String -> String -> Bool
hasSubstraux [] _ _ = False
hasSubstraux _ [] _ = True
hasSubstraux (x:xs) (y:ys) acc
    | x == y    = hasSubstraux xs ys (acc ++ [x])
    | otherwise = hasSubstraux xs (y:ys) ""

sortSpeciesWithSubstr :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr zoo sub = (filterSpecies zoo (\(name, count) -> hasSubstr name sub), filterSpecies zoo (\(name, count) -> not (hasSubstr name sub)))

rabbit :: (Integral a) => [a]
rabbit = 2:3 : zipWith (+) rabbit (tail rabbit)

rabbitYears :: (Integral a) => a -> Int
rabbitYears pop = head [x | x<-[0..] , rabbit !! x >= pop]

