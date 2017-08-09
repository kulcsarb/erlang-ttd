%%%-------------------------------------------------------------------
%%% @author kulcsarb@gmail.com
%%% @copyright (C) 2017
%%% @doc
%%%
%%% @end
%%% Created : 08. Aug 2017 8:23 AM
%%%-------------------------------------------------------------------
-module(gen_world).
-author("kulcsarb@gmail.com").

%% API
-export([generate_world/1]).


-type gen_world_mode() :: {newgame | empty | random | heightmap}.

-record(landscape_settings,
        { mode            = empty     :: gen_world_mode()
        , populate_world  = false     :: boolean()
        , size_x          = 256       :: integer()
        , size_y          = 256       :: integer()
        }).


-type landscape_settings() :: #landscape_settings{}.


-spec generate_world(Settings) -> boolean() when
      Settings :: landscape_settings().
generate_world(#landscape_settings{mode = Mode, populate_world = Populate} = Settings) when is_record(Settings, landscape_settings) ->

  % generate new random seed if we need to do
  % set random seed

  % whatever it is
  startup_economy(),

  if
    Mode == empty ->
      heightmap:flat_empty_world(256, 256),
      convert_ground_tiles_into_water_tiles()
    ; true ->
      generate_landscape(),
      generate_clear_tile(),
      if Populate == true ->
          generate_industries(),
          generate_objects(),
          generate_trees()
        ; true -> ok
      end
  end,

  startup_companies(),
  startup_engines(),
  startup_disasters(),

  if Mode =/= empty ->
      % start new game   ??  game:new()

      % for 0x500 times -> run_tile_loop()   ????
    if Populate == true ->
        % run 2500 times -> game:game_loop()
        % break when game:is_sleeping()   ????
      ok
      ; true -> ok
    end

    ; true -> ok
  end,


  ok.




startup_economy() ->
  ok.

startup_companies() ->
  ok.

startup_engines() ->
  ok.

startup_disasters() ->
  ok.


convert_ground_tiles_into_water_tiles() ->
  ok.


generate_landscape() ->
  ok.

generate_clear_tile() ->
  ok.


generate_industries() ->
  ok.

generate_objects() ->
  ok.

generate_trees() ->
  ok.

