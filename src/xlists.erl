-module(xlists).
-extends(lists).
-export([ keyfind/4, keysfind/3, take/2 ]).

-spec keyfind(Key::term(), N::integer(), TupleList::[tuple()], Default::tuple()) -> tuple().
keyfind(Key, N, TupleList, Default) ->
    case lists:keyfind(Key, N, TupleList) of
        false -> Default;
        Tuple -> Tuple
    end.

take(Elem, List) ->
   take_int(Elem, List, []).
   
% Maintains order
take_int(_Elem, [], Acc) -> {false, Acc};
take_int(Elem, [Elem | Rest], Acc) -> {true, lists:append(Acc, Rest)};
take_int(Elem, [ListElem | Rest], Acc) ->
   take_int(Elem, Rest, lists:append(Acc, [ListElem])).

%% Naive slow implementation
keysfind(Keys, N, TupleList) ->
   [lists:keyfind(Key, N, TupleList) || Key <- Keys].
