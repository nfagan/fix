
function conf = create(do_save)

% CREATE -- Create the config file. 
%
% Define editable properties of the config file here.

if ( nargin < 1 ), do_save = false; end

const = fix.config.constants();

conf = struct();

% ID
conf.(const.config_id) = true;

% PATHS
PATHS = struct();
PATHS.repositories = fileparts( fix.util.get_project_folder() );
PATHS.stimuli = fullfile( fix.util.get_project_folder(), 'stimuli' );

% DEPENDENCIES
DEPENDS = struct();
DEPENDS.repositories = { 'ptb_helpers', 'ptb', 'shared_utils' };

%	INTERFACE
INTERFACE = struct();
INTERFACE.stop_key = ptb.keys.esc();
INTERFACE.use_mouse = true;
INTERFACE.open_window = true;
INTERFACE.skip_sync_tests = false;
INTERFACE.is_debug = true;
INTERFACE.use_reward = false;
INTERFACE.get_reward_manager = @(program, conf) [];
INTERFACE.shutdown_reward_manager = @(manager, program) [];
INTERFACE.give_reward = @(manager, channel, amount) [];
INTERFACE.reward_key = KbName( 'r' );

%	SCREEN
SCREEN = struct();

SCREEN.full_size = get( 0, 'screensize' );
SCREEN.index = 0;
SCREEN.background_color = [ 0 0 0 ];
SCREEN.rect = [ 0, 0, 400, 400 ];

%	TIMINGS
TIMINGS = struct();

time_in = struct();
time_in.task = inf;
time_in.new_trial = 0;
time_in.present_image = 2;
time_in.image_success = 1;
time_in.image_error = 1;
time_in.fixation = 1;
time_in.iti = 1;

TIMINGS.time_in = time_in;

%	STIMULI
STIMULI = struct();
STIMULI.setup = struct();

STIMULI.setup.img1 = struct( ...
 'class', 'Rect' ...
 , 'position', ptb.WindowDependent( 0.5, 'normalized' ) ...
 , 'size', ptb.WindowDependent( 100, 'px' ) ...
 , 'has_target', true ...
 , 'padding', ptb.WindowDependent( 50, 'px' ) ...
 , 'target_duration', 0.3 ...
 , 'color', ptb.Color.Green ...
);

STIMULI.setup.success_img = struct( ...
 'class', 'Rect' ...
 , 'position', ptb.WindowDependent( 0.5, 'normalized' ) ...
 , 'size', ptb.WindowDependent( 100, 'px' ) ...
 , 'has_target', false ...
 , 'color', set( ptb.Color(), [0, 255, 0] ) ...
);

STIMULI.setup.error_img = struct( ...
 'class', 'Rect' ...
 , 'position', ptb.WindowDependent( 0.5, 'normalized' ) ...
 , 'size', ptb.WindowDependent( 100, 'px' ) ...
 , 'has_target', false ...
 , 'color', set( ptb.Color(), [0, 0, 255] ) ...
);

% STRUCTURE
STRUCTURE = struct();
STRUCTURE.face_calibration_pixel_dimensions = [400, 400];
STRUCTURE.face_calibration_point_settings = fix.util.default_calibration_point_settings();
STRUCTURE.key_press_reward_amount = 100;

% EXPORT
conf.PATHS = PATHS;
conf.DEPENDS = DEPENDS;
conf.TIMINGS = TIMINGS;
conf.STIMULI = STIMULI;
conf.SCREEN = SCREEN;
conf.INTERFACE = INTERFACE;
conf.STRUCTURE = STRUCTURE;

if ( do_save )
 fix.config.save( conf );
end

end