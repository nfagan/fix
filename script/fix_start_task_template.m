conf = fix.config.reconcile;

conf.SCREEN.rect = [0, 0, 1024, 768];
conf.STRUCTURE.face_calibration_pixel_dimensions = [400, 400];

% corner_offset: how far inwards from the corners are the target points.
% Larger values push the corner points closer to the middle of the face.
% Default: 0.1
conf.STRUCTURE.face_calibration_point_settings.corner_offset = 0.1;

% eye_height: the proportional distance between the top and bottom eye
% target points.
% Default: 0.075
conf.STRUCTURE.face_calibration_point_settings.eye_height = 0.075;

% eye_width: the proportional distance between the left and right eye
% target points.
% Default: 0.1
conf.STRUCTURE.face_calibration_point_settings.eye_width = 0.1;

% eye_y_offset: the proportional distance from the top of the face to the
% middle of the "eye roi". Larger values push the eyes downwards in the
% face.
% Default: 0.3
conf.STRUCTURE.face_calibration_point_settings.eye_y_offset = 0.3;

% mouth_height: the proportional distance between the top and bottom mouth
% target points.
% Default: 0.075
conf.STRUCTURE.face_calibration_point_settings.mouth_height = 0.075;

% mouth_y_offset: the proportional distance from the top of the face to the
% middle of the "mouth roi". Larger values push the mouth downwards in the
% face.
% Default: 0.6
conf.STRUCTURE.face_calibration_point_settings.mouth_y_offset = 0.6;

% Reward from pressing the reward key,
conf.STRUCTURE.key_press_reward_amount = 100;

conf.INTERFACE.is_debug = false;
% Set to false to use eyelink.
conf.INTERFACE.use_mouse = true;
% Set to false to skip reward.
conf.INTERFACE.use_reward = true;
% Reward key.
conf.INTERFACE.reward_key = ptb.keys.r();

conf.INTERFACE.get_reward_manager = @fix.util.get_brains_reward_manager;
conf.INTERFACE.give_reward = @fix.util.brains_deliver_reward;
conf.INTERFACE.shutdown_reward_manager = @fix.util.shutdown_brains_reward_manager;

% Stimulus properties
conf.STIMULI.setup.img1.color = [255, 0, 0];
conf.STIMULI.setup.img1.target_duration = 0.3;
conf.STIMULI.setup.img1.size = [50, 50];

% Amount of time to show a square before moving iti,
% in the event that no fixation is made.
conf.TIMINGS.time_in.fixation = 4;
conf.TIMINGS.time_in.iti = 1;

fix.task.start( conf );