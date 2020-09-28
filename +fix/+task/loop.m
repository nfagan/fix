function loop(task, program)

% LOOP -- Task loop function.
%
% fix.task.loop( task, program ); is called each frame, and is
% generally responsible for updating objects that keep track of elapsed
% time, or which acquire samples of some signal in real time. 
% 
% `task` is a handle to the `ptb.Task` object managing the sequence of
% states. `program` is a handle to a `ptb.Reference` object containing
% global data accessible across states.
%
% See also fix.task.setup

update( program.Value.frame_timer );
% Acquire new samples from XYSources, and update the cumuluative looking
% time spent in bounds of each target.
update( program.Value.updater );

if ( ptb.util.is_key_down(ptb.keys.space) )
  program.Value.advance_face_point = true;
end

if ( is_reward_key_down(program) && ...
     key_press_reward_timer_elapsed(program) )
  reset( program.Value.key_press_reward.timer );
  program.Value.key_press_reward.deliver();
end
  
end

function tf = key_press_reward_timer_elapsed(program)

timer = program.Value.key_press_reward.timer;
interval = program.Value.key_press_reward.interval;

tf = elapsed( timer ) >= interval;

end

function tf = is_reward_key_down(program)

tf = ptb.util.is_key_down( program.Value.config.INTERFACE.reward_key );

end