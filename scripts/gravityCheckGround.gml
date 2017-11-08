///gravityCheckGround()
//Applies gravity only if we are not on the ground
//Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]

if !ground {
    if inWater {
        yspeed += gravAccel * waterAccelMod;
    }else{
        yspeed += gravAccel;
    }
    
    if yspeed > 7 {
        yspeed = 7;
    }
}
