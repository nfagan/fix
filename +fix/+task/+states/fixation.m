function state = fixation(program, conf)

state = ptb.State();
state.Name = 'fixation';
state.Duration = conf.TIMINGS.time_in.fixation;
state.UserData = struct();

state.Entry = @(state) entry(state, program);
state.Loop = @(state) loop(state, program);
state.Exit = @(state) exit(state, program);

end

function entry(state, program)

state.UserData.acquired_fixation = false;

window = program.Value.window;
image_obj = program.Value.stimuli.img1;
target_obj = program.Value.targets.img1;
reset( target_obj );

image_obj.Position = get_fixation_target_position( program, get(window.Rect) );
draw( image_obj, window );

if ( program.Value.is_debug )
 draw( target_obj.Bounds, window );
end

flip( window );

end

function loop(state, program)

target_obj = program.Value.targets.img1;

if ( target_obj.IsDurationMet )
 % Mark that we successfully acquired fixation.
 state.UserData.acquired_fixation = true;
 % Proceed to the exit() function.
 escape( state );
end

end

function exit(state, program)

states = program.Value.states;

if ( state.UserData.acquired_fixation )
 next( state, states('new_trial') );
else
 next( state, states('new_trial') );
end

end

function pos = get_fixation_target_position(program, window_rect)

face_point_index = program.Value.face_point_index;
face_dims = program.Value.config.STRUCTURE.face_calibration_pixel_dimensions;
point_settings = program.Value.config.STRUCTURE.face_calibration_point_settings;

pos = ...
 fix.util.nth_face_calibration_point_location( window_rect, face_dims, point_settings, face_point_index ); 

end