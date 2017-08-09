%%%-------------------------------------------------------------------
%% @doc ettd top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(ettd_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    MapServerSpec = {map_server, {map_server, start_link, []}, permanent, 5, worker, []},
    {ok, { {one_for_all, 0, 1}, [MapServerSpec]} }.

%%====================================================================
%% Internal functions
%%====================================================================
