import Data.List

data List a = Nil | Cons a (List a)

toList :: [a] -> List a
toList [] = Nil
toList (x:xs) = Cons x (toList xs)

fromListList :: List a -> [a]
fromListList Nil = []
fromListList (Cons x xs) = x : fromListList xs

data Suits = Clubs | Spades | Hearts | Diamonds deriving (Eq, Show, Enum, Ord)
data Faces = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | J | Q | K | A deriving (Eq, Show, Enum, Ord)
data Card = Assoc Suits Faces deriving (Eq, Show)

allCards :: [Card]
allCards = [Assoc s f | s <- [Clubs .. Diamonds], f <- [Two .. A]]

cmp1 :: Card -> Card -> Ordering
cmp1 (Assoc s1 f1) (Assoc s2 f2)
  | s1 == s2  = compare f1 f2
  | otherwise = compare s1 s2

cmp2 :: Card -> Card -> Ordering
cmp2 (Assoc s1 f1) (Assoc s2 f2)
  | f1 == f2  = compare s1 s2
  | otherwise = compare f1 f2


-- Binary search tree (Set) definition
data Set a = EmptySet | Node a (Set a) (Set a) deriving (Show)

-- Empty set
empty :: Set a
empty = EmptySet

-- Check membership
member :: Ord a => a -> Set a -> Bool
member _ EmptySet = False
member x (Node y left right)
  | x == y    = True
  | x < y     = member x left
  | otherwise = member x right

-- Insert an element
insert :: Ord a => a -> Set a -> Set a
insert x EmptySet = Node x EmptySet EmptySet
insert x (Node y left right)
  | x == y    = Node y left right
  | x < y     = Node y (insert x left) right
  | otherwise = Node y left (insert x right)

-- Build a set from a list
fromList :: Ord a => [a] -> Set a
fromList xs = build (sort xs)
  where
    build [] = EmptySet
    build xs = Node x (build xs') (build xs'')
      where
        k      = length xs `div` 2
        xs'    = take k xs
        x:xs'' = drop k xs

size :: Set a -> Int
size EmptySet = 0
size (Node n l r) = 1 + size l + size r

height :: Set a -> Int
height EmptySet = 0
height (Node n l r) = 1 + max (height l) (height r)

set1 = foldr insert empty [1..1000]
set2 = fromList [1..1000]

-- set1 is unbalanced, set2 is balanced
-- set1 height is 1000, set2 height is 10

data Prop = Const Bool
        | Var Name
        | Not Prop
        | And Prop Prop
        | Or Prop Prop
        | Imply Prop Prop

eval :: Env → Prop → Bool
eval env (Const b) = b
eval env (Var x)
              = case lookup x env of
                  Just b  → b
                  Nothing → error "undefined"
eval env (Not p) = not (eval env p)
eval env (And p q)= eval env p && eval env q
eval env (Or p q) = eval env p || eval env q
eval env (Imply p q)= not (eval env p) || eval env q

vars :: Prop -> [Name]
vars (Const b) = b
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = (vars p ++ vars q)
vars (Or p q) = (vars p ++ vars q)
vars (Imply p q) = (vars p ++ vars q)

booleans :: Int -> [[Bool]]
booleans 0 = [[]]
    let snd = booleans (n-1)
    in [ False : bs | bs <- snd ] ++ [ True : bs | bs <- snd ]

environments :: [Name] -> [Env]
environments names =
    let n = length names
        bools = booleans n
    in map (zip names) bools

table :: Prop -> [ (Env, Bool) ]
table pro =
    let vs = (vars pro)
        envs = environments vs
    in [ (env, eval env pro) | env <- envs ]

satiesfies :: Prop -> [Env]
satiesfies p = [ env | (env, b) <- table p , b==True ]
