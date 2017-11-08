///gravityCheckGroundExt(grav)
//Applies gravity only if we are not on the ground
//Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]

if !ground {
    if inWater {
        yspeed += argument0 * waterAccelMod;
    }else{
        yspeed += argument0;
    }
    
    if yspeed > 7 {
        yspeed = 7;
    }
}
