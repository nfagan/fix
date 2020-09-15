conf = fix.config.reconcile;

conf.SCREEN.rect = [0, 0, 1024, 768];
conf.STRUCTURE.face_calibration_pixel_dimensions = [400, 400];

conf.INTERFACE.is_debug = false;

% Set to false to use eyelink.
conf.INTERFACE.use_mouse = true;

% Stimulus properties
conf.STIMULI.setup.img1.color = [255, 0, 0];
conf.STIMULI.setup.img1.target_duration = 0.3;

% Amount of time to show a square before moving to the next one,
% in the event that no fixation is made.
conf.TIMINGS.time_in.fixation = inf;

fix.task.start( conf );