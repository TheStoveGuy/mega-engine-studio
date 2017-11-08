///arcCalcXspeed(yspeed, gravity, spawn_x, spawn_y, impact_x, impact_y)
var t_yspeed; t_yspeed = argument0; 
var t_grav; t_grav =  argument1;
var t_spawn_x; t_spawn_x = argument2; 
var t_spawn_y; t_spawn_y = argument3; 
var t_impact_x; t_impact_x = argument4; 
var t_impact_y; t_impact_y = argument5;

var t_y; t_y = t_spawn_y; 
var t_yprev; t_yprev = t_y; 
var time; time = 0;
do {
    time += 1;
    t_yprev = t_y;
    t_y += t_yspeed;
    t_yspeed += t_grav;
}
until (t_y >= t_impact_y && t_yprev < t_impact_y) || (t_yspeed > 0 && t_y > t_impact_y);

return (t_impact_x - t_spawn_x) / time;
