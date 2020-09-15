function pos = nth_face_calibration_point_location(screen_rect, face_dims, opts, index)

outer_corner_off_prop = opts.corner_offset;
top_off_y = opts.eye_y_offset;
mouth_off_y = opts.mouth_y_offset;

eye_height_prop = opts.eye_height;
eye_width_prop = opts.eye_width;
mouth_height_prop = opts.mouth_height;

screen_dims = [ screen_rect(3) - screen_rect(1), screen_rect(4) - screen_rect(2) ];
screen_center = screen_rect([1, 2]) + screen_dims * 0.5;
face_off = screen_center - face_dims * 0.5;

corner_off_px = face_dims * outer_corner_off_prop;
top_off_y_px = face_dims(2) * top_off_y;
eye_width_px = face_dims(1) * eye_width_prop;
eye_height_px = face_dims(2) * eye_height_prop;

eye_min_x = face_dims(1) * 0.5 - eye_width_px * 0.5;
eye_max_x = face_dims(1) * 0.5 + eye_width_px * 0.5;

eye_min_y = top_off_y_px - eye_height_px * 0.5;
eye_max_y = top_off_y_px + eye_height_px * 0.5;

mouth_off_px = face_dims(2) * mouth_off_y;
mouth_height_px = face_dims(2) * mouth_height_prop;

cox = corner_off_px(1);
coy = corner_off_px(2);

switch ( index )
 case 1
 % top-left
 off = corner_off_px;
 case 2
 % top-right
 off = [face_dims(1) - cox, coy];
 case 3
 % bottom-left
 off = [cox, face_dims(2) - coy];
 case 4
 % bottom-right
 off = [face_dims(1) - cox, face_dims(2) - coy];
 case 5
 % eye-top-left
 off = [eye_min_x, eye_min_y];
 case 6
 % eye-top-right
 off = [eye_max_x, eye_min_y];
 case 7
 % eye-bottom-left
 off = [eye_min_x, eye_max_y];
 case 8
 % eye-bottom-right
 off = [eye_max_x, eye_max_y];
 case 9
 % mouth, top
 off = [face_dims(1) * 0.5, mouth_off_px];
 case 10
 % mouth, bottom
 off = [face_dims(1) * 0.5, mouth_off_px + mouth_height_px];
end

abs_pos = off + face_off;
pos = (abs_pos - screen_rect([1, 2])) ./ screen_dims;

end