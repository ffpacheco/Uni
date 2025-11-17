maxIndex :: Ord a => [a] -> (a, Int)
maxIndex (x:xs) = maxInd (x,0) 0 xs

maxInd :: Ord a => (a,Int) -> Int -> [a] -> (a, Int)
maxInd a b [] = a
maxInd (n,i) k (x:xs) = if x>= n then maxInd (x,k+1) (k+1) xs
                    else maxInd (n,i) (k+1) xs

zeros :: [Int]
zeros = repeat 0

hondt :: Int -> [Int] -> [Int]
hondt 0 n = []
hondt deputados votos = aux deputados votos (replicate(length votos) 0)

aux :: Int -> [Int] -> [Int] -> [Int]
aux 0 votos mandatos = mandatos
aux n votos mandatos =  let qs=quocientes (zip votos mandatos)
                            (a,idx) = maxIndex qs
                            updatedMandatos= take idx mandatos ++ [(mandatos !! idx) +1 ] ++ drop (idx +1) mandatos
                        in aux (n-1) votos updatedMandatos

quocientes :: [(Int, Int)] -> [Int]
quocientes [] = []
quocientes ((a,b):xs) = [div a (1+b) ] ++ quocientes xs
