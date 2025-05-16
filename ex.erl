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


test(_A, [], []) ->
    ok;
test(Func, [Param | Next], [Head | Tail]) ->
    Res = Func(Param),
    if Res == Head -> 
        io:format("ok");
    true -> 
        error("Assertion Failed")
    end,
    test(Func, Next, Tail).


run_all() -> 
    C = 4,
    io:format("Exercicio 1 ~n"),

    io:format("a) ~n"),

    io:format("b) ~n"),
    test(fun a1/1, lists:seq(1, C), [3, 5,7,9]),

    b1(4).
