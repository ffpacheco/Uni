--Implement bisection, which finds the zero of an unary function using the bisection method
bisection :: ( RealFloat a) => a -> a -> a -> (a -> a) -> a
bisection a b tol f =
    if f a * f b > 0
    then 0.0
    else if abs (b - a) < tol
         then (a + b) / 2
         else if f ((a + b) / 2) * f a < 0
              then bisection a ((a + b) / 2) tol f
              else bisection ((a + b) / 2) b tol f

