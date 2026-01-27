type Movie = (String, [String])

myMovies :: [Movie]
myMovies = [("Titanic", ["Kate Winslet","Leonardo DiCaprio"]), ("Revolutionary Road",["Kate Winslet","Leonardo DiCaprio"]),
            ("Elektra ",["Jennifer Garner"]), ("The Great Gatsby",["Leonardo DiCaprio"])]

findActors :: [Movie] -> String -> Maybe [String]
findActors [] _ = Nothing
findActors ((m,a):movies) movie
    | m == movie = Just a
    | otherwise = findActors movies movie

moviesWithActor :: [Movie] -> String -> [Movie]
moviesWithActor [] _ = []
moviesWithActor ((m,a):movies) actor
    | elem actor a = (m,a) : moviesWithActor movies actor
    | otherwise = moviesWithActor movies actor

removeDups :: Eq a => [a] -> [a]
removeDups [] = []
removeDups (x:xs) = x : removeDups( filter (/=x) xs)

uniqueActors :: [Movie] -> [String]
uniqueActors [] = []
uniqueActors movies = filter oneFilm allActors
    where
        allActors = removeDups (concat [a | (m,a)<- movies])
        oneFilm actor = length (moviesWithActor movies actor) == 1

actorFrequencies :: [Movie] -> [(String, Int)]
actorFrequencies [] = []
actorFrequencies movies = [(actor,(length (moviesWithActor movies actor))) | actor <- allActors]
    where
        allActors = removeDups (concat [a | (m,a)<- movies])

funcX :: [a] -> Int
funcX [] = 0
funcX (_:xs) = -1 + funcX xs

evenPos ::Eq a => [a] -> [a] -> [(a,a)]
evenPos [] ys = []
evenPos xs [] = []
evenPos xs ys = [ ( x , y ) | (i, x , y) <- zipped, even i , x /= y ]
    where
        zipped = zip3 [0..] xs ys

list :: [Int]
list = gera 0 1
    where
        gera a0 a1 = a0 : gera a1 (3 * a1 - 2* a0)

data Prop = Const Bool
        | Neg Prop
        | Conj Prop Prop
        | Disj Prop Prop
        | Impl Prop Prop

valor :: Prop -> Bool
valor (Const b)  = b
valor (Neg b)    = not (valor b)
valor (Conj a b) = (valor b) && (valor a)
valor (Disj a b) = (valor a) || (valor b)
valor (Impl a b) = not (valor a) || (valor b)
