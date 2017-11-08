///gravityNoGround()
//Applies gravity no matter what

if inWater {
    yspeed += gravAccel * waterAccelMod;
}else{
    yspeed += gravAccel;
}

if yspeed > 7 {
    yspeed = 7;
}
