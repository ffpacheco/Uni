import Data.List (nub)

-- tipo para expressÃµes proposicionais
data Prop = Const Bool        -- constantes
          | Var Char          -- variÃ¡veis
          | Neg Prop          -- negaÃ§Ã£o
          | Conj Prop Prop    -- conjunÃ§Ã£o
          | Disj Prop Prop    -- disjunÃ§Ã£o
          | Impl Prop Prop    -- implicaÃ§Ã£o
            deriving (Eq,Show)

type Env = [(Char,Bool)]

eval :: Prop -> Env-> Bool
eval (Const b) env = b
eval (Var c) env = case lookup c env of
                     Just b  -> b
                     Nothing -> False
eval (Neg p) env = not (eval p env)
eval (Conj p1 p2) env = (eval p1 env) && (eval p2 env)
eval (Disj p1 p2) env = (eval p1 env) || (eval p2 env)
eval (Impl p1 p2) env = not (eval p1 env) || (eval p2 env)


vars :: Prop -> [Char]
vars (Const _)      = []
vars (Var x)        = [x]
vars (Neg p)        = vars p
vars (Conj p q)     = vars p ++ vars q
vars (Disj p q)     = vars p ++ vars q
vars (Impl p q)     = vars p ++ vars q

allVars :: Prop -> [Char]
allVars p = nub (vars p)

envs :: [Char] -> [Env]
envs []     = [[]]
envs (x:xs) =
    [ (x,False):e | e <- envs xs ] ++
    [ (x,True):e  | e <- envs xs ]

satisfaz :: Prop -> Bool
satisfaz p = or [ eval p e | e <- envs (allVars p) ]

showProp :: Prop -> String
showProp (Const True)    = "T"
showProp (Const False)   = "F"
showProp (Var c)         = [c]
showProp (Neg p)         = "(~" ++ showProp p ++ ")"
showProp (Conj p1 p2)    = "(" ++ showProp p1 ++ " && " ++ showProp p2 ++ ")"
showProp (Disj p1 p2)    = "(" ++ showProp p1 ++ " || " ++ showProp p2 ++ ")"
showProp (Impl p1 p2)    = "(" ++ showProp p1 ++ " -> " ++ showProp p2 ++ ")"

data Arv a = Vazia | No a (Arv a) (Arv a)

sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No x left right) = x + sumArv left + sumArv right

listarDecr :: Arv a -> [a]
listarDecr Vazia = []
listarDecr (No x left right) = listarDecr right ++ [x] ++ listarDecr left

nivel :: Int -> Arv a -> [a]
nivel a Vazia = []
nivel 0 (No x _ _) = [x]
nivel n (No _ left right) = nivel (n-1) left ++ nivel (n-1) right

maisDir :: Arv a -> a
maisDir (No x _ Vazia) = x
maisDir (No _ _ dir)   = maisDir dir

remover :: Ord a => a -> Arv a -> Arv a
remover _ Vazia = Vazia
remover y (No x esq dir)
    | y < x = No x (remover y esq) dir
    | y > x = No x esq (remover y dir)
    | otherwise =
        case esq of
            Vazia -> dir
            _     -> case dir of
                        Vazia -> esq
                        _     -> let m = maisDir esq
                                 in No m (remover m esq) dir
