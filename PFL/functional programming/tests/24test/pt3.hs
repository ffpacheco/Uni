data KdTree = Empty | Node Char (Int,Int) KdTree KdTree deriving (Eq,Show)

tree1 :: KdTree
tree1 = Node 'x' (3,3) (Node 'y' (2,2) Empty Empty) (Node 'y' (4,4) Empty Empty)

tree2 :: KdTree
tree2 = Node 'x' (3,3) (Node 'y' (2,2) (Node 'x' (1,1) Empty Empty) Empty) (Node 'y' (4,4) (Node 'x' (3,2) Empty Empty) Empty)

insert :: (Int,Int) -> KdTree -> KdTree
insert p Empty = Node 'x' p Empty Empty
insert (x,y) (Node 'x' (nx,ny) left right)
    | x < nx = Node 'y' (nx,ny) (insert (x,y) left) right
    | otherwise = Node 'y' (nx,ny) left (insert (x,y) right)
insert (x,y) (Node 'y' (nx,ny) left right)
    | y < ny = Node 'x' (nx,ny) (insert (x,y) left) right
    | otherwise = Node 'x' (nx,ny) left (insert (x,y) right)

