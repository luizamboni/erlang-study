-module(example).

-behaviour(gen_server).
-compile(export_all).

%%  in example_sup -> 
%      console, { example, start_link, [] }, 
start_link() ->
  gen_server:start_link({local,?MODULE},?MODULE, [], [])
.

% send_message(Msg) -> 
%   gen_server:call(?MODULE, {new, Msg})
% .

% cai aqui %
init(_Args) ->
     
     process_flag(trap_exit, true)
   , io:format("~p:~p has started  !!!!!!!  ~p ~p ~n", 
      [ ?MODULE, ?LINE, self(), _Args ]
    )
    % If the initialization is successful, the function
    % should return {ok,State} or {ok,State,Timeout} 
  , { ok, { started, { date(), time() } } }
.
 
handle_cast(Subject, State) -> 
  io:format("tick ~p ~p ~n",[self(),time()]), 
  case random:uniform(4) of
    1 -> 
      io:format("fail ~n",[]), 
      { fail_here, ?MODULE, ?LINE, A} = State;
    _ -> ok
  end, 
  {noreply, State}
.

terminate(Reason, State)->
  io:format("~p:~p ~p has terminated by reason ~p ~p ~n", 
           [ ?MODULE, ?LINE, self(), Reason, State ]
  ),
  ok
.

code_change(Vsn,State,Ext)->
  io:format("~p:~p code_change ~p ~p ~p ~n",
   [ ?MODULE, ?LINE, Vsn, State, Ext ]
  ),
  { ok,State}
.
% Synchronous Requests - Call
handle_call(Request, From, State)->
  io:format("~p:~p handle_call ~p ~p ~p ~n",
   [ ?MODULE, ?LINE, Request, From, State]
  ), 
  {reply, From, State}
.
% Asynchronous Requests - Cast
% gen_server:cast(ref, {free, Ch}).
handle_cast(Request, From, State)->
  io:format("~p:~p handle_cast ~p ~p ~p ~n",
   [ ?MODULE, ?LINE, Request, From, State]
  ),

  {noreply, State}
.
 
handle_info(Info,State) ->
  io:format("~p:~p handle_info ~p ~p  ~n",
    [ ?MODULE, ?LINE, Info,State]
  ),

  {noreply, State}
.

format_status(normal, [PDict, State]) -> 
  {normal, [PDict, State]}
.