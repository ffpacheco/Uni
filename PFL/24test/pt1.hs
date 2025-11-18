import Data.List

type Match = ((String,String), (Int,Int))
type MatchDay = [Match]
type League = [MatchDay]

myLeague :: League
myLeague = [[(("Porto","Sporting"),(2,2)),(("Benfica","Vitoria SC"),(4,0))],[(("Porto","Benfica"),(5,0)),(("Vitoria SC","Sporting"),(3,2))], [(("Vitoria SC","Porto"),(1,2)),(("Sporting","Benfica"),(2,1))]]

winner :: Match-> String
winner ((t1,t2),(s1,s2))
    | s1>s2 = t1
    | s2>s1 = t2
    | otherwise = "draw"

matchDayScore :: String -> MatchDay -> Int
matchDayScore team [] = 0
matchDayScore team (((t1,t2), (s1,s2)): ms)
    | winner ((t1,t2), (s1,s2)) == team =  3 + matchDayScore team ms
    | winner ((t1,t2), (s1,s2)) == "draw" && (t1 == team || t2 == team)= 1 + matchDayScore team ms
    | otherwise = matchDayScore team ms

leagueScore :: String -> League -> Int
leagueScore t = foldr (\d acc -> matchDayScore t d + acc) 0

sortByCond :: Ord a => [a] -> (a -> a -> Bool) -> [a]
sortByCond [] _ = []
sortByCond [x] _ = [x]
sortByCond l cmp = merge (sortByCond l1 cmp) (sortByCond l2 cmp) cmp
    where
        (l1 ,l2) = splitAt (div (length l) 2) l
        merge :: Ord a => [a] -> [a] -> (a -> a -> Bool) -> [a]
        merge [] l _ = l
        merge l [] _ = l
        merge (x:xs) (y:ys) cmp
            | cmp x y = x:(merge xs (y:ys) cmp)
            | otherwise = y:(merge (x:xs) ys cmp)

teams :: League -> [String]
teams l = nub([t | matchDay <- l, ((t1,t2), _) <- matchDay, t<-[t1,t2]] )

teamScores :: League -> [(String, Int)]
teamScores l = [(team, leagueScore team l) | team <- teams l]

cmpare :: (String , Int) -> (String , Int) -> Bool
cmpare (t1,s1) (t2,s2)
    | s1 > s2 = True
    | s2>s1 =False
    |otherwise = t1<t2

ranking :: League -> [(String , Int)]
ranking l = sortByCond (teamScores l) cmpare

numMatchDaysWithDraws :: League -> Int
numMatchDaysWithDraws [] = 0
numMatchDaysWithDraws (md:mds)
    | hasDraw md = 1+ numMatchDaysWithDraws mds
    | otherwise = numMatchDaysWithDraws mds

hasDraw :: MatchDay -> Bool
hasDraw [] = False
hasDraw (((t1,t2),(s1,s2)):ms)
    | s1 == s2 = True
    | otherwise = hasDraw ms

bigWins :: League -> [(Int,[String])]
bigWins l = [(dayIndex + 1, [winner ((t1,t2),(s1,s2)) | ((t1,t2),(s1,s2)) <- md, abs(s1 - s2) >= 3,
    winner ((t1,t2),(s1,s2)) /= "draw"]) |
    (md, dayIndex) <- zip l [0..]]
