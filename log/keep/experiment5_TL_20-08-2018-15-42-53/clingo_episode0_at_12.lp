1{action(down, T); action(up, T); action(right, T); action(left, T)}1 :- time(T), not finished(T).
#show state_at/2.
 #show action/2.

cell((0..17, 0..8)).
#minimize{1, X, T: action(X,T)}.
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).
adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).
adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).
%START
state_at(V1, T+1) :- time(T), adjacent(right, V0, V1), state_at(V0, T), action(left, T), not wall(V1).state_at(V0, T+1) :- time(T), adjacent(right, V0, V1), state_at(V1, T), action(right, T), not wall(V0).state_at(V1, T+1) :- time(T), adjacent(down, V0, V1), state_at(V0, T), action(up, T), not wall(V1).state_at(V0, T+1) :- time(T), adjacent(down, V0, V1), state_at(V1, T), action(down, T), not wall(V0).state_at(V0, T+1) :- time(T), adjacent(right, V0, V1), state_at(V0, T), action(left, T), wall(V1).state_at(V1, T+1) :- time(T), adjacent(right, V0, V1), state_at(V1, T), action(right, T), wall(V0).state_at(V0, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), wall(V1).state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V1, T), action(up, T), wall(V0).
%END
finished(T):- goal(T2), time(T), T >= T2.
 goal(T):- state_at((16, 1), T), not finished(T-1).
goalMet:- goal(T).
:- not goalMet.

wall((1, 8)).

wall((0, 7)).

wall((1, 6)).

wall((2, 8)).

wall((3, 6)).

wall((2, 4)).

wall((0, 5)).

wall((3, 4)).

wall((5, 5)).

wall((4, 4)).
%AAA
state_at((3, 5), 12).
%BBB
%CCC
time(12..250).
%DDD
%ANSWER SETS

%state_at((3,5),12)
%state_at((4,5),13)
%action(right,12)
%action(down,13)
%state_at((4,6),14)
%action(right,14)
%state_at((5,6),15)
%action(right,15)
%state_at((6,6),16)
%action(right,16)
%state_at((7,6),17)
%action(right,17)
%state_at((8,6),18)
%action(right,18)
%state_at((9,6),19)
%action(right,19)
%state_at((10,6),20)
%action(right,20)
%state_at((11,6),21)
%action(right,21)
%state_at((12,6),22)
%action(right,22)
%state_at((13,6),23)
%action(right,23)
%state_at((14,6),24)
%action(right,24)
%state_at((15,6),25)
%action(right,25)
%state_at((16,6),26)
%action(up,26)
%state_at((16,5),27)
%action(up,27)
%state_at((16,4),28)
%action(up,28)
%state_at((16,3),29)
%action(up,29)
%state_at((16,2),30)
%action(up,30)
%state_at((16,1),31)
