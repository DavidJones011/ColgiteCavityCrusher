/// @description Insert description here
// You can write your code in this editor

// camera variables
target = obj_player;
cameraLerpAmount = 0.05;
posX = 0;
posY = 0;
cameraWidth = 1920;
cameraHeight = 1080;
zoomLerpAmount = 0.05;
zoomFactor = 1;
desiredZoomFactor = 1;

// resize surface to match window
surface_resize(application_surface, cameraWidth, cameraHeight);

// variables used for effects
offsetX = 0;
offsetY = 0;
shakeAmplitude = 0;
shakeTimer = 0.0;
shakeDuration = 0.0;

view_enabled = true;
view_visible[0] = true;

// set camera position and size
view_xport[0] = posX;
view_yport[0] = posY;
view_wport[0] = cameraWidth;
view_hport[0] = cameraHeight;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, -1, -1);


// ** Some camera functions to be called from other objects ** //

// have the camera start shaking
function shake_camera(_amplitude = 3, _duration = 1)
{
	shakeAmplitude = _amplitude;
	shakeTimer = _duration;
	shakeDuration = _duration;
	offsetX = 0;
	offsetY = 0;
}

// set the target for the camera to follow
function set_target(_target=noone)
{
	if(is_undefined(_target) || _target == self || _target == all)
		target = noone;
	target = _target;
}

// sets the position for the camera to go to, sets noone as the target
function set_position(_x, _y)
{
	target = noone;
	posX = _x;
	posY = _y;
}

// has the camera zoom in or out
// x == 1    means the camera is at its default width and height
// 0 < x < 1 means the camera will zoom in
// x > 1     means the camera will zoom out
function zoom_camera(_amount)
{
	desiredZoomFactor = max(_amount, 0.001);
}