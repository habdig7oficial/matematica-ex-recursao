-module(ex).
-export([run_all/0]).

a1(0) -> 1;
a1(N) -> 
    2 + a1(N - 1).

b1(0) -> 1;
b1(N) -> 
    3 * b1(N - 1).

c1(0) -> 1;
c1(N) -> 
    math:pow(2, c1(N - 1)).

d1(0) -> 1;
d1(N) -> 
    math:pow(d1(N - 1), 2) + d1(N - 1) + 1.

a2(0) -> 0;
a2(N) -> 
    6 + a2(N - 1).

b2(0) -> 1;
b2(N) -> 
    2 + b2(N - 1).

c2(0) -> 1;
c2(N) -> 
    10 * c2(N - 1).

d2(0) -> 5;
d2(N) -> 
    d2(N - 1).

e2(0) -> -2;
e2(N) -> 
    4 + e2(N - 1).

f2(0) -> 0;
f2(N) -> 
    (f2(N - 1) + (N - 1)) rem 2 * 2.

g2(0) -> 0;
g2(N) -> 
    2 * N + g2(N - 1).

h2(0) -> 0;
h2(N) -> 
   (2 * N) - 1 + h2(N - 1).

p3(0) -> 1;
p3(N) -> 
    5 * p3(N - 1).

p4(0) -> 0;
p4(N) -> 
    p4(N - 1) + 7.

test(_A, [], []) ->
    ok;
test(Func, [Param | Next], [Head | Tail]) ->
    Res = Func(Param),
    if Res == Head -> 
        io:format("Value: ~p~n", [Res]);
    true -> 
        io:format("Expected: ~p, Got: ~p",[Head, Res]),
        error("Assertion Failed")
    end,
    test(Func, Next, Tail).


run_all() -> 
    C = 4,
    io:format("Exercicio 1 ~n"),

    io:format("a) ~n"),
    test(fun a1/1, lists:seq(0, C), [1, 3, 5, 7, 9]),

    io:format("b) ~n"),
    test(fun b1/1, lists:seq(0, C), [1, 3, 9, 27, 81]),

    io:format("c) ~n"),
    test(fun c1/1, lists:seq(0, C), [1, 2, 4, 16, 65536]),

    io:format("d) ~n"),
    test(fun d1/1, lists:seq(0, C), [1, 3, 13, 183, 33673.0]),


    io:format("~n~nExercicio 2 ~n"),

    io:format("a) ~n"),
    test(fun a2/1, lists:seq(0, C), [0, 6, 12, 18, 24]),

    io:format("b) ~n"),
    test(fun b2/1, lists:seq(0, C), [1, 3, 5, 7, 9]),

    io:format("c) ~n"),
    test(fun c2/1, lists:seq(0, C), [1, 10, 100, 1000, 10000]),

    io:format("d) ~n"),
    test(fun d2/1, lists:seq(0, C), [5, 5, 5, 5, 5]),

    io:format("e) ~n"),
    test(fun e2/1, lists:seq(0, C), [-2, 2, 6, 10, 14]),

    io:format("f) ~n"),
    test(fun f2/1, lists:seq(0, C), [0, 0, 2, 0, 2]),

    io:format("g) ~n"),
    test(fun g2/1, lists:seq(0, C), [0, 2, 6, 12, 20]),

    io:format("h) ~n"),
    test(fun h2/1, lists:seq(0, C), [0, 1, 4, 9, 16]),

    io:format("~n~nExercicio 3 ~n"),
    test(fun p3/1, lists:seq(0, C), [1, 5, 25, 125, 625]),

    io:format("~n~nExercicio 4 ~n"),
    test(fun p4/1, lists:seq(0, C), [0, 7, 14, 21, 28])
.