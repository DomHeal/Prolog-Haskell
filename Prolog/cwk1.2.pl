% Solving sujiko puzzle from newspapers.
% Brute force solver


/***** prob 1
     e.g. find numbers 1-9 satisfying
    X1 X2 X3
     23 27
    X4 X5 X6
     17 17
    7  X7  2                     
where numbers surrounding circled numbers add up to that number
*******/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2 (a)
  

% member_rem(X,S,R) chooses element for S leaving remainder R

member_rem(X,[X|Xs],Xs).

member_rem(X,[Y|Xs],[Y|R]) :-
        member_rem(X,Xs,R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2 (b)

% gen list of N distinct numbers from set S

gen_num(0,[],_).        % assume S is a list of numbers

gen_num(N,[X|Xs],S) :-
        N>0,
        N1 is N-1,
        member_rem(X,S,R),
        gen_num(N1,Xs,R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% 2 (c)

% generate a possible solution for 1
% a list of digits where 7th and 9 are 7 and 2


gen_sol1([X1,X2,X3,X4,X5,X6,X7]):-
        gen_num(7,[X1,X2,X3,X4,X5,X6,X7],[1,3,4,5,6,8,9]).

% solve sujiko puzzle

solve_sujiko1([X1,X2,X3,X4,X5,X6,X7]):-
        gen_sol1([X1,X2,X3,X4,X5,X6,X7]),
        X4+X5+X7 =:= 10,
        X5+X6+X7 =:= 15,
        X1+X2+X4+X5 =:= 23,
        X2+X3+X5+X6 =:= 27.

/***** prob 2
     e.g. find numbers 1-9 satisfying
    X1 X2 7
     21 22
    5  X3 X4
     24 14
    X5 X6 X7                     
where numbers surrounding circled numbers add up to that number
*******/
        
% generate a possible solution for 2
% a list of digits where 7th and 9 are 7 and 2

gen_sol2([X1,X2,X3,X4,X5,X6,X7]):-
        gen_num(7,[X1,X2,X3,X4,X5,X6,X7],[1,2,3,4,6,8,9]).

% solve sujiko puzzle

solve_sujiko2([X1,X2,X3,X4,X5,X6,X7]):-
        gen_sol2([X1,X2,X3,X4,X5,X6,X7]),
        X1+X2+X3 =:= 21-5,
        X2+X3+X4 =:= 22-7,
        X3+X5+X6 =:= 24-5,
        X3+X4+X6+X7 =:= 14.
           

