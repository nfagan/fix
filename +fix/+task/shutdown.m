function shutdown(program)

ListenChar( 0 );

maybe_shutdown_reward_manager( program );

end

function maybe_shutdown_reward_manager(program)

if ( isfield(program.Value, 'reward_manager') )
  shutdown_func = program.Value.config.INTERFACE.shutdown_reward_manager;
  
  try
    shutdown_func( program.Value.reward_manager, program );
  catch err
    warning( 'Failed to shutdown reward manager: "%s".', err.message );
  end
end

end