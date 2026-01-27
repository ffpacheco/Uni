maxpos :: [Int] -> Int
maxpos list = maxposAux list 0

maxposAux :: [Int]->Int -> Int
maxposAux [] max = max
maxposAux (x:xs) max
    | x >=max = maxposAux xs x
    | otherwise = maxposAux xs max

dups :: [a] -> [a]
dups [] = []
dups [x] = [x,x]
dups (x:y:xs) = [x,x,y] ++ dups xs

vogais :: [Char]
vogais = ['a','e','i','o','u']

transforma :: String -> String
transforma [] =[]
transforma (x:xs)
    | elem x vogais = [x,'p',x] ++ transforma xs
    | otherwise = [x]++ transforma xs

type Vector = [Int]
type Matriz = [[Int]]

transposta :: Matriz -> Matriz
transposta [] = []
transposta ([]:_) = []
transposta m = map head m : transposta (map tail m)

prodInterno :: Vector -> Vector -> Int
prodInterno [] [] = 0
prodInterno (x:xs) (y:ys) = x*y + prodInterno xs ys

prodMat :: Matriz -> Matriz -> Matriz
prodMat a b = [[prodInterno la cb | cb <- transposta b] | la <- a]

data Arv a = F | N a (Arv a) (Arv a) deriving(Show)

alturas :: Arv a -> Arv Int
alturas F = F
alturas (N name left right) = N (alturaAux (N name left right)) (alturas left) (alturas right)

alturaAux :: Arv a -> Int
alturaAux F = 0
alturaAux (N a left right) = 1 + max (alturaAux left)(alturaAux right)

equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N a left right) = abs (alturaAux left - alturaAux right) <= 1 && equilibrada left && equilibrada right

f :: (a->b->c)->a->b->c
f fun x y = fun x y
