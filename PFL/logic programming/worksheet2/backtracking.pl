r(a, b).
r(a, d).
r(b, a).
r(a, c).

s(b, c).
s(b, d).
s(c, c).
s(d, e).

r(X, Y), s(Y, Z). % 0 backtracks
s(Y, Y), r(X, Y). % 0 backtracks
r(X, Y), s(Y, Y). % 3 backtracks
