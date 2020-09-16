function state = iti(program, conf)

state = ptb.State();
state.Name = 'iti';
state.Duration = conf.TIMINGS.time_in.iti;
state.UserData = struct();

state.Entry = @(state) entry(state, program);
state.Loop = @(state) loop(state, program);
state.Exit = @(state) exit(state, program);

end

function entry(state, program)

flip( program.Value.window );

end

function loop(state, program)

end

function exit(state, program)

states = program.Value.states;
next( state, states('new_trial') );

end