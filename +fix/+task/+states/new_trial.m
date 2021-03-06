function state = new_trial(program, conf)

state = ptb.State();
state.Name = 'new_trial';

state.Entry = @(state) entry(state, program);
state.Loop = @(state) loop(state, program);
state.Exit = @(state) exit(state, program);

end

function entry(state, program)

if ( ~isfield(program.Value, 'face_point_index') )
  program.Value.face_point_index = 1;
end

if ( isfield(program.Value, 'advance_face_point') && ...
     program.Value.advance_face_point )
  program.Value.advance_face_point = false;
  advance_face_point( program );
end

end

function loop(state, program)
% Nothing to do right now.
end

function exit(state, program)

states = program.Value.states;
next( state, states('fixation') );

end

function advance_face_point(program)

program.Value.face_point_index = program.Value.face_point_index + 1;
  
if ( program.Value.face_point_index > fix.util.num_face_points() )
  program.Value.face_point_index = 1;
end

end