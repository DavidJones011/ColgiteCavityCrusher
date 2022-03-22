/// @description Insert description here
// You can write your code in this editor

// update the camera position when a target is set
if(target != noone)
{
	var desiredX = target.x - camera_get_view_width(view_camera[0]) * 0.5;
	desiredX = clamp(desiredX, 0, room_width - camera_get_view_width(view_camera[0]));	
	//var desiredY = target.y - camera_get_view_height(view_camera[0]) * 0.5;
	posX = lerp(posX, desiredX, cameraLerpAmount);
	// disable for now, perhaps just add a constraint
	//posY = lerp(posY, desiredY, cameraLerpAmount);
}

// update camera shaking
var deltaTime = delta_time / 1000000;
shakeTimer = max(shakeTimer - deltaTime, 0);
if(shakeTimer > 0.0)
{
	var randX = random_range(-1,1);
	var randY = random_range(-1,1);
	var inverseLength = 1/sqrt((randX * randX) + (randY * randY));
	var amplitude = shakeAmplitude * (shakeTimer/shakeDuration);
	randX *= inverseLength * amplitude;
	randY *= inverseLength * amplitude;
	offsetX = randX;
	offsetY = randY;
}

// update the camera zooming
if(abs(zoomFactor - desiredZoomFactor) > 0.0001)
{
	zoomFactor = lerp(zoomFactor, desiredZoomFactor, zoomLerpAmount);
	posX += (camera_get_view_width(view_camera[0]) - cameraWidth * zoomFactor) * 0.5
	posY += (camera_get_view_height(view_camera[0]) - cameraHeight * zoomFactor) * 0.5
}

// update camera position and size
camera_set_view_pos(view_camera[0], posX + offsetX, posY + offsetY);
camera_set_view_size(view_camera[0], cameraWidth * zoomFactor, cameraHeight * zoomFactor);