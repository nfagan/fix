function shutdown_brains_reward_manager(manager, ~)

if ( ~isempty(manager) )
  try
    close( manager );
  catch err
    warning( 'Failed to close serial communication: "%s".', err.message );
  end
end

end