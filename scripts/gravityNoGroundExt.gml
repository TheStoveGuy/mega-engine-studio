///gravityNoGroundExt(grav)
//Applies gravity no matter what

if inWater {
    yspeed += argument0 * waterAccelMod;
}else{
    yspeed += argument0;
}

if yspeed > 7 {
    yspeed = 7;
}
