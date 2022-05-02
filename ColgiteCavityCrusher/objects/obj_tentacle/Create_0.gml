/// @description Insert description here
// You can write your code in this editor

depth = CalcDepthFromY() - 10;
isMoving = true;
time = 0;
initial_y = y;
initial_x = x;

has_hit = false;

function reset_hit()
{
	has_hit = false;
}