job(technician, eleuterio).
job(technician, juvenaldo).
job(analyst, leonilde).
job(analyst, marciliano).
job(engineer, osvaldo).
job(engineer, porfirio).
job(engineer, reginaldo).
job(supervisor, sisnando).
job(chief_supervisor, gertrudes).
job(secretary, felismina).
job(director, asdrubal).

supervised_by(technician, engineer).
supervised_by(engineer, supervisor).
supervised_by(analyst, supervisor).
supervised_by(supervisor, chief_supervisor).
supervised_by(chief_supervisor, director).
supervised_by(secretary, director).

isSupervisor(X,Y) :- job(JX,X), job(JY,Y), supervised_by(JY,JX).

sameJobSupervisor(X,Y) :- job(JX,X), job(JY,Y), supervised_by(JY,Z1), supervised_by(JX,Z2), X \= Y, Z1=Z2.

responsable(X) :- job(J,X), supervised_by(Z,J), supervised_by(Y,J), Y\=Z, !.

isXSupervisorOfYsSupervisor(X,Y) :- job(JX,X), job(JY,Y), supervised_by(JY,Z), supervised_by(Z,JX), !.
