
type City = String
type Path = [City]
type Distance = Int
type RoadMap = [(City,City,Distance)]

gTest1 :: RoadMap
gTest1 = [("0","1",10),("0","2",15),("0","3",20),("1","2",35),("1","3",25),("2","3",30)]

gTest2 :: RoadMap -- unconnected graph
gTest2 = [("0","1",4),("2","3",2)]

adjacent :: RoadMap -> City -> [(City,Distance)]
adjacent rm c = [(c2,d) | (c1,c2,d) <- rm, c1 == c] ++ [(c1,d) | (c1,c2,d) <- rm, c2 == c]

areConnected :: RoadMap -> City -> City -> Bool
areConnected rm org dis = if length([(c1,c2) | (c1,c2,d) <- rm , c1 == org && c2 == dis] ++ [(c1,c2) | (c1,c2,d) <- rm , c1 == dis && c2 == org])>0 then True else False
