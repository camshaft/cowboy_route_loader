-module(cowboy_route_loader).

-export([compile/1]).
-export([compile/2]).

compile(App) ->
  compile(App, "routes.econf").

compile(App, Filename) ->
  PrivDir = privdir:get(App),
  {ok, Routes} = file:consult(filename:join(PrivDir, Filename)),
  cowboy_router:compile(Routes).
