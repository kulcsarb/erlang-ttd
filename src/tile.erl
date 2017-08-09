%%%-------------------------------------------------------------------
%%% @author kulcsarb
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Aug 2017 10:59 AM
%%%-------------------------------------------------------------------
-module(tile).
-author("kulcsarb").

-include("records.hrl").

%% API
-export([set_type/2]).
-export([set_tropic_zone/2]).
-export([set_height/2]).
-export([clear_bridge_middle/1]).
-export([clear_single_bridge_middle/2]).
-export([is_type/2]).
-export([is_bridge/1]).
-export([is_bridge_tile/1]).



-export_type([map_tile/0]).
-export_type([tile_index/0]).



set_type(<<_:4, BridgeType:2, TropicType:2>>, Target) ->
  <<Target:4, BridgeType:2, TropicType:2 >>.

set_tropic_zone(<<TileType:4, BridgeType:2, _:2>>, TropicType) ->
  <<TileType:4, BridgeType:2, TropicType:2>>.

clear_bridge_middle(<<TileType:4, _:2, TropicType:2>>) ->
  <<TileType:4, 0:2, TropicType:2>>.


clear_single_bridge_middle(<<TileType:4, Ay:1, _Ax:1, TropicType:2>>, ?AXIS_X) ->
  <<TileType:4, Ay:1, 0:1, TropicType:2>>;
clear_single_bridge_middle(<<TileType:4, _Ay:1, Ax:1, TropicType:2>>, ?AXIS_Y) ->
  <<TileType:4, 0:1, Ax:1, TropicType:2>>.




-spec set_height(Tile :: map_tile(), Height :: integer()) -> NewTile :: map_tile().
set_height(Tile, Height) when is_record(Tile, map_tile) ->
  Tile#map_tile{height=Height}.


is_type(#map_tile{type=TileType}, Type) ->
  <<T:4, _:2, _:2>> = TileType,
  T == Type.


is_bridge(Tile) ->
  is_type(Tile, ?MP_TUNNELBRIDGE) andalso has_bit(Tile#map_tile.m5, 7).

is_bridge_tile(Tile) ->
  is_bridge(Tile).


has_bit(Value, Bit) ->
  (Value band (1 bsl Bit)) > 0.





