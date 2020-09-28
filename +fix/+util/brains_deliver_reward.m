function brains_deliver_reward(manager, channel, amount)

if ( ~isempty(manager) )
  reward( manager, channel, amount );
end

end