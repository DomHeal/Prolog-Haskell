% Finding median of list of numbers without sorting
% esentially similar to quick-sort

:-use_module(library(random)).
:-use_module(library(samsort)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1(a) i)
% n-th element of non-empty list assume |L| >= N

nth_elt(1,[X|Xs],X,Xs) :-!.

nth_elt(N,[X|Xs],E,[X|R]) :-
        N>1,
        N1 is N-1,
        nth_elt(N1,Xs,E,R).


% nth element with test - fails if length < N

nth_elt_with_test(N,L,X,R) :-
        length(L,Len),
        Len > 0,
        Len >= N,
        nth_elt(N,L,X,R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1(a) ii)

% using built in sort


kth_sorted_elt(K,L,E) :-
        samsort(L,SL),
        nth_elt(K,SL,E,_).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1(a) iii)

% choose a random element from list L leaving remainder R

choose_random_elt(L,V,R):-
        length(L,Len),
        L1 is Len+1,
        random(1,L1,N),
        nth_elt(N,L,V,R).

% split on element E Lt is all elements < E and Rt all element >= E
% E is an element of L


split([],_,[],[]):-!.

split([X|Xs],E,Lt,Rt) :-
        (X < E -> Lt = [X|Lt1],split(Xs,E,Lt1,Rt);
                Rt = [X|Rt1], split(Xs,E,Lt,Rt1)).

% kth_elt Kth element of L when sorted is V

kth_sorted_elt2(K,L,V) :-
        choose_random_elt(L,E,R),
        split(R,E,L1,R1),
        length(L1,N1),
        K1 is K-1,
        (N1 =:= K1 -> V = E;
                (N1 > K1 -> kth_sorted_elt2(K,L1,V);
                           K2 is K1-N1,kth_sorted_elt2(K2,R1,V))).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1(a) iv)

% median - if length 2N+1 then N+1, otherwise Nth

median(L,M) :-
        length(L,Len),
        D is Len // 2,
        (Len mod 2 =:= 0 -> D1 is D;
                        D1 is D+1),
        kth_sorted_elt2(D1,L,M).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1(b) i)
% sumsqrs_diff sum of the squares of the differences

% straightforward recursive version 

sumsqrs_diff([],[],0).

sumsqrs_diff([X|Xs],[Y|Ys],S) :-
        sumsqrs_diff(Xs,Ys,Ss),
        S is (X-Y)*(X-Y) + Ss.

euclid(X,Y,E) :-
        sumsqrs_diff(X,Y,SS),
        E is sqrt(SS).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1(b) ii)

% euclid with acc parameter saving the sum of the diffs square
% apply to lists of numbers of same length

euclid_a([],[],SS,E) :-
        E is sqrt(SS).

euclid_a([X|Xs],[Y|Ys],SS,S) :-
        SS1 is SS + (X-Y)*(X-Y),
        euclid_a(Xs,Ys,SS1,S).

euclid2(X,Y,E) :- euclid_a(X,Y,0,E).





