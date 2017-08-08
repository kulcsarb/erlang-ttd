%%%-------------------------------------------------------------------
%%% @author kulcsarb@gmail.com
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 08. Aug 2017 9:12 AM
%%%-------------------------------------------------------------------
-module(heightmap).
-author("kulcsarb@gmail.com").

%% API
-export([flat_empty_world/3]).


flat_empty_world(MapSizeX, MapSizeY, TileHeight) ->

  EdgeDistance = 2,

  [ set_tile_height(X, Y, TileHeight) ||  X <- lists:seq(EdgeDistance, MapSizeX-(EdgeDistance+1)), Y <- lists:seq(EdgeDistance, MapSizeY-(EdgeDistance+1)) ],

  fix_slopes().

fix_slopes() ->
  ok.

set_tile_height(Row, Col, Height) ->
  %% here comes the magic
  ok.

