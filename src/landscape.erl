%%%-------------------------------------------------------------------
%%% @author kulcsarb
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Aug 2017 12:06 PM
%%%-------------------------------------------------------------------
-module(landscape).
-author("kulcsarb").

-include("records.hrl").

%% API
-export([initialize/2]).
-export([make_void/2]).


initialize(MapMaxX, MapMaxY) ->
  initialize_border_to_void(MapMaxX, MapMaxY),
  [ initialize_tile(X, Y) || X <- lists:seq(1, MapMaxX-1), Y <- lists:seq(1, MapMaxY-1) ].



-spec make_void(X :: integer(), Y :: integer()) -> map_tile().
make_void(X, Y) ->
  #map_tile{index={X,Y}, type = tile:set_type(0, ?MP_VOID)}.



%%%-------------------------------------------------------------------
%%% Private functions
%%% @end
%%%-------------------------------------------------------------------

initialize_border_to_void(MapMaxX, MapMaxY) ->
  %  [ make_void(X, 0) || X <- lists:seq(0, MapMaxX)],
  [ make_void(X, MapMaxY)  || X <- lists:seq(0, MapMaxX)],
  %  [ make_void(0, Y) || Y <- lists:seq(0, MapMaxY)],
  [ make_void(MapMaxX, Y)  || Y <- lists:seq(0, MapMaxY)].


initialize_tile(X, Y) ->
  ok.
%%  make_clear(X, Y, ?MP_CLEAR, 3),
%%  set_tile_height(X, Y, 0),
%%  set_tropic_zone(X, Y, ?TROPICZONE_NORMAL),
%%  clear_bridge(X, Y).




