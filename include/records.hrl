%%%-------------------------------------------------------------------
%%% @author kulcsarb
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Aug 2017 12:07 PM
%%%-------------------------------------------------------------------
-author("kulcsarb").

-define(MP_CLEAR, 0).           %%< A tile without any structures, i.e. grass, rocks, farm fields etc.
-define(MP_RAILWAY, 1).         %%< A railway
-define(MP_ROAD, 2).            %%< A tile with road (or tram tracks)
-define(MP_HOUSE, 3).           %%< A house by a town
-define(MP_TREES, 4).           %%< Tile got trees
-define(MP_STATION, 5).         %%< A tile of a station
-define(MP_WATER, 6).           %%< Water tile
-define(MP_VOID, 7).            %%< Invisible tiles at the SW and SE border
-define(MP_INDUSTRY, 8).        %%< Part of an industry
-define(MP_TUNNELBRIDGE, 9).    %%< Tunnel entry/exit and bridge heads
-define(MP_OBJECT, 10).         %%< Contains objects such as transmitters and owned land


-define(TROPICZONE_NORMAL, 0).
-define(TROPICZONE_DESERT, 1).
-define(TROPICZONE_RAINFOREST, 2).

-define(AXIS_X, 0).             %%< The X axis
-define(AXIS_Y, 1).             %%< The y axis
-define(AXIS_END, 2).           %%< Used for iterations
-define(INVALID_AXIS, 16#FF).   %%< Flag for an invalid Axis


-type tile_index() :: {integer(), integer()}.

-record(map_tile, {
    index   = 0   :: tile_index()
  , type    = 0   :: binary()
  , height  = 0   :: non_neg_integer()
  , m1      = 0   :: binary()
  , m2      = 0   :: binary()
  , m3      = 0   :: binary()
  , m4      = 0   :: binary()
  , m5      = 0   :: binary()
  , m6      = 0   :: binary()
  , m7      = 0   :: binary()}).

-type map_tile() :: #map_tile{}.


