type Match = ((String,String), (Int,Int))
type MatchDay = [Match]
type League = [MatchDay]
myLeague :: League
myLeague = [
    [(("Porto","Sporting"),(2,2)),(("Benfica","Vitoria SC"),(4,0))],
    [(("Porto","Benfica"),(5,0)),(("Vitoria SC","Sporting"),(3,2))],
    [(("Vitoria SC","Porto"),(1,2)),(("Sporting","Benfica"),(2,1))]]

winner :: Match -> String
winner ((team1,team2), (s1,s2))
    | s1>s2 = team1
    | s1<s2 = team2
    |otherwise = "draw"

matchDayScore :: String -> MatchDay -> Int
matchDayScore team [] = 0
matchDayScore team (((team1,team2), (s1,s2)):matches)
    | team /= team1 && team /= team2 = matchDayScore team matches
    | win == team = 3
    | win == "draw" = 1
    | otherwise = 0
    where
        win :: String
        win = winner ((team1,team2), (s1,s2))

leagueScore :: String -> League -> Int
leagueScore t = foldr (\d acc -> matchDayScore t d + acc) 0

sortByCond :: Ord a => [a] -> (a -> a -> Bool) -> [a]
sortByCond [] _ = []
sortByCond [x] _ = [x]
sortByCond l cmp = merge (sortByCond l1 cmp) (sortByCond l2 cmp) cmp
    where (l1 ,l2) = splitAt (div (length l) 2) l

merge :: Ord a => [a] -> [a] -> (a -> a -> Bool) -> [a]
merge [] l _ = l
merge l [] _ = l
merge (x:xs) (y:ys) cmp
    | cmp x y = x:(merge xs (y:ys) cmp)
    | otherwise = y:(merge (x:xs) ys cmp)


teamsInLeague :: League -> [String]
teamsInLeague league = [home | day <- league, ((home,_),_)<- day] ++ [away | day <- league, ((_,away),_)<- day]

removeDups :: Eq a => [a] -> [a]
removeDups [] = []
removeDups (x:xs) = x : removeDups (filter (/= x) xs)

ranking :: League -> [(String,Int)]
ranking league = sortByCond teamsWScores compareTeams
    where
        rawTeams= teamsInLeague league
        allTeams = removeDups rawTeams
        teamsWScores = [(t,leagueScore t league)| t <- allTeams]

        compareTeams (name1,score1) (name2,score2)
            | score1 > score2 = True
            | score1 < score2 = False
            | otherwise = name1 <= name2

numMatchDaysWithDraws :: League -> Int
numMatchDaysWithDraws [] = 0
numMatchDaysWithDraws league = length drawDays
    where
        isDrawDay matchDay = any (\m -> winner m == "draw") matchDay
        drawDays = filter isDrawDay league

bigWins :: League -> [(Int,[String])]
bigWins league = [(i,winnersOfDay day) | (i,day) <- indexLeague]
    where
        indexLeague = zip [1..] league
        winnersOfDay matches = [winner m | m <- matches , isBigWin m]
        isBigWin ((_,_),(s1,s2)) = abs(s1-s2)>= 3


winningStreaks :: League -> [(String,Int,Int)]
winningStreaks [] = []
winningStreaks league = [(team, indStart, indEnd) | team <- allTeams, (indStart, indEnd) <- findStreak (winningsForTeam team)]
    where
        indexedLeague = zip [1..] league
        rawTeams = teamsInLeague league
        allTeams = removeDups rawTeams

        winningsForTeam team = [i | (i, day) <- indexedLeague, matchDayScore team day == 3]

        findStreak [] = []
        findStreak (d:ds) = run d d ds
            where
                run start end []
                    | end - start >= 1 = [(start,end)]
                    | otherwise = []
                run start end (prox:rest)
                    | prox ==  end +1 = run start prox rest
                    | end - start >= 1 = (start,end) : run prox prox rest
                    | otherwise = run prox prox rest

type City = String
type Path = [City]
type Distance = Int
type RoadMap = [(City,City,Distance)]

gTest1 :: RoadMap
gTest1 = [("0","1",10),("0","2",15),("0","3",20),("1","2",35),("1","3",25),("2","3",30)]

gTest2 :: RoadMap -- unconnected graph
gTest2 = [("0","1",4),("2","3",2)]

adjacent :: RoadMap -> City -> [(City,Distance)]
adjacent [] _ = []
adjacent ((city1,city2,dist):xs) city
    |city == city1 = [(city2, dist)]++adjacent xs city
    |city == city2 = [(city1, dist)]++adjacent xs city
    | otherwise = adjacent xs city

areAdjacent :: RoadMap -> City -> City -> Bool
areAdjacent [] _ _ = False
areAdjacent  ((city1,city2,dist):xs) orig dest
    | orig == city1 && dest == city2 = True
    | orig == city2 && dest == city1 = True
    | otherwise = False

search :: RoadMap -> City -> City -> [City] -> Bool
search roadMap orig dest visited
    | orig == dest = True
    | elem orig visited = False
    | otherwise = neighboordSearch (adjacent roadMap orig)
    where
        neighboordSearch [] = False
        neighboordSearch ((v,_):vs)
            | search roadMap v dest (orig:visited ) = True
            | otherwise = neighboordSearch vs

areConnected :: RoadMap -> City -> City -> Bool
areConnected roadMap orig dest = search roadMap orig dest []

