%ILASP

%state_after(V0) :- state_before(V0), action(right).
%state_after(V1) :- adjacent(right, V0, V1), state_before(V0), action(left).
%state_after(V1) :- adjacent(down, V0, V1), state_before(V0), action(up).
cell((0..19, 0..8)).
#modeb(1, link_start(var(cell)), (positive)).
#modeb(1, link_dest(var(cell)), (positive)).
% (X+1,Y) is right next to (X,Y)
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).

adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).

% (X,Y+1) is above next to (X,Y)
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).

adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).

#modeh(state_after(var(cell))).

#modeb(1, adjacent(const(action), var(cell), var(cell)), (positive)).
#modeb(1, state_before(var(cell)), (positive)).
#modeb(1, action(const(action)), (positive)).
#modeb(1, wall(var(cell))).

#max_penalty(50).

#constant(action, right).
#constant(action, left).
#constant(action, down).
#constant(action, up).
#pos({state_after((3,4))}, {state_after((4,5)),state_after((3,6)),state_after((2,5)),state_after((3,5))}, {state_before((3,5)).action(up).}).
#pos({state_after((3,4))}, {state_after((4,4)),state_after((3,5)),state_after((2,4)),state_after((3,3)),state_after((3,3))}, {state_before((3,4)).action(right).wall((4, 4)). }).
#pos({}, {state_after((4,4)),state_after((3,5)),state_after((2,4)),state_after((3,3))}, {state_before((3,4)).action(right).wall((4, 4)). }).
#pos({}, {state_after((4,4)),state_after((3,5)),state_after((2,4)),state_after((3,4))}, {state_before((3,4)).action(up).wall((4, 4)). }).
#pos({state_after((2,3))}, {state_after((4,3)),state_after((3,4)),state_after((3,2)),state_after((3,3))}, {state_before((3,3)).action(left).}).
