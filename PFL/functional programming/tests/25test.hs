type Node = String   -- some city
type Dist = Int      -- some distance
type Edges = [(Node,Node,Dist)] -- directed connections

portugal :: Edges
portugal = [ ("Porto", "Aveiro", 76)
           , ("Aveiro", "Coimbra", 63)
           , ("Aveiro", "Leiria", 117)
           , ("Coimbra", "Leiria", 76)
           , ("Leiria", "Santarem", 83)
           , ("Santarem", "Lisboa", 82)
           ]

inverse :: Edges -> Edges
inverse edges = [(c2,c1,d) | (c1,c2,d) <- edges]
 
newEdges :: Edges -> Edges
newEdges edges = [(c1,c3,d1 + d2)| (c1,c2,d1) <- edges , (c4,c3,d2)<- edges, c1 /= c3, c2==c4]

pathDistance :: Edges -> [Node] -> Maybe Dist
pathDistance [] _ = Nothing
pathDistance edges nodes = pathDistanceAux edges nodes 0

pathDistanceAux :: Edges -> [Node] -> Int -> Maybe Dist
pathDistanceAux _ [y] dist = Just dist
pathDistanceAux edges (x:y:zs) curDist =
                    case [d | (a,b,d) <- edges , a == x && b == y || a == y && b == x ] of
                        [d] -> pathDistanceAux edges (y:zs) (curDist + d)
                        [] -> Nothing

shortest :: Edges -> Edges
shortest [] = []
shortest ((a,b,d):xs) = [(a,b,dist)] ++ shortest edges
    where
        dist = minimum (d : [dist | (x,y,dist) <- xs, x==a && y==b])
        edges = [(x,y,z)| (x,y,z) <- xs , x/=a || y/=b ]

type VarName = Char
data Prop = Const Bool
          | Variable VarName
          | Not Prop
          | And Prop Prop
          | Imply Prop Prop
          deriving Show

rename :: [(VarName,VarName)] -> Prop -> Prop
rename _ (Const b) = Const b
rename ren (Variable x) = case lookup x ren of
                        Just y -> Variable y
                        Nothing -> Variable x
rename ren (Not prop) = Not (rename ren prop)
rename ren (And prop1 prop2) = And (rename ren prop1) (rename ren prop2)
rename ren (Imply prop1 prop2) = Imply (rename ren prop1) (rename ren prop2)

nubBy :: (a -> a -> Bool) -> [a] -> [a]
nubBy _ [] = []
nubBy pred (x:xs) = x : nubBy pred [y | y <- xs , not (pred x y)]

vars :: Prop -> [Char]
vars (Const b) = []
vars (Variable x) = [x]
vars (Not prop) = vars prop
vars (And prop1 prop2) = vars prop1 ++ vars prop2
vars (Imply prop1 prop2) = vars prop1 ++ vars prop2

normalize :: Prop -> Prop
normalize prop =
            let ziped = zip (vars prop) "abcdefghijklmnopqrstuvwxyz"
            in rename ziped prop
