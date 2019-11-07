-module(macros).

-define(ADULT_AGE, 21).
-define(NEW_PERSON(Name, Age), #{name => Name, age => Age}).
-define(SOMEONE, ?NEW_PERSON("Someone", 44)).

is_adult(Person) ->
    Age = maps:get(age, Person, 0),
    Age >= ?ADULT_AGE.


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

is_adult_test() ->
    ?assert(is_adult(?NEW_PERSON("test1", 22))),
    ?assertNot(is_adult(?NEW_PERSON("test2", 12))),
    ?assert(is_adult(?SOMEONE)).

-endif.