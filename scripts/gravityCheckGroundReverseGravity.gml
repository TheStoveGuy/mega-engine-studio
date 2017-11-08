///gravityCheckGroundReverseGravity()
//Applies gravity only if we are not on the ground
//Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]

//this script is only used by sakugarne apparently so he's more floaty in water.

if !ground {
    if inWater {
        yspeed += gravAccel * 0.38 * global.GravityDir;
    }else{
        yspeed += gravAccel * global.GravityDir;
    }
    
    if abs(yspeed) > 7 {
        yspeed = 7 * global.GravityDir;
    }
}
