-module(xdict).
-extends(dict).
-export([ find/2, store/3 ]).

find(Key, Dict) ->
	case dict:find(Key, Dict) of
		error -> false;
		{ok, Value} -> {Key, Value}
	end.

store(Key, Dict, Value) ->
	dict:store(Key, Value, Dict).	

