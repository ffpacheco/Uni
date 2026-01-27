type Species = (String, Int)
type Zoo = [Species]

isEndangered :: Species -> Bool
isEndangered (name,pop)
    | pop <= 100 = True
    | otherwise = False

updateSpecies :: Species -> Int -> Species
updateSpecies (name, pop) newborns = (name,pop+newborns)

filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] _ = []
filterSpecies (x:xs) predicate
    | predicate x == True = [x] ++ filterSpecies xs predicate
    | otherwise = filterSpecies xs predicate

countAnimals :: Zoo -> Int
countAnimals [] = 0
countAnimals ((name,pop):xs) = pop + countAnimals xs

substring :: (Integral a) => String -> a -> a -> String
substring string start end =
    drop (fromIntegral start)(take (fromIntegral end +1) string)

hasSubstr :: String -> String -> Bool
hasSubstr string sub= hasSubstrAux string sub 0

hasSubstrAux :: String -> String -> Int -> Bool
hasSubstrAux string sub num
    | num > length string = False
    | substring string num (length sub + num -1)  == sub = True
    | otherwise = hasSubstrAux string sub (num + 1)

sortSpeciesWithSubstr :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr zoo sub = (buildZoo1 zoo sub, buildZoo2 zoo sub)

buildZoo1 :: Zoo -> String -> Zoo
buildZoo1 [] _ = []
buildZoo1 ((name, pop): xs) sub
    | hasSubstr name sub == True = [(name,pop)] ++ buildZoo1 xs sub
    | otherwise = buildZoo1 xs sub

buildZoo2 :: Zoo -> String -> Zoo
buildZoo2 [] _ = []
buildZoo2 ((name, pop):xs) sub
    | hasSubstr name sub == True = buildZoo2 xs sub
    | otherwise = [(name,pop)] ++ buildZoo2 xs sub

rabbits :: (Integral a ) => [a]
rabbits = gera 2 3
    where
        gera x y = x : (gera y (x + y) )

rabbitYears :: (Integral a) => a -> Int
rabbitYears val = rabbitYearsAux val 0

rabbitYearsAux :: (Integral a) => a -> Int -> Int
rabbitYearsAux val ind
    | rabbits !! ind >= val = ind
    | otherwise = rabbitYearsAux val (ind + 1)

data Dendrogram = Leaf String | Node Dendrogram Int Dendrogram
myDendro :: Dendrogram
myDendro = Node (Node (Leaf "dog") 3 (Leaf "cat")) 5 (Leaf "octopus")

dendroWidth :: Dendrogram -> Int
dendroWidth (Leaf str) = 0
dendroWidth (Node left int right) = dendroWidthLeft left + int*2 + dendroWidthRight right

dendroWidthLeft :: Dendrogram -> Int
dendroWidthLeft (Leaf str) = 0
dendroWidthLeft (Node left int _) = int + dendroWidthLeft left

dendroWidthRight :: Dendrogram -> Int
dendroWidthRight (Leaf str) = 0
dendroWidthRight (Node _ int right) = int + dendroWidthRight right

dendroInBounds :: Dendrogram -> Int -> [String]
dendroInBounds dend bound = dendroInBoundsAux dend 0 bound

dendroInBoundsAux :: Dendrogram -> Int -> Int -> [String]
dendroInBoundsAux (Leaf str) pos bound
    | abs pos <= bound = [str]
    | otherwise = []

dendroInBoundsAux (Node left int right) pos bound = dendroInBoundsAux left (pos - int) bound ++ dendroInBoundsAux right (pos + int) bound
