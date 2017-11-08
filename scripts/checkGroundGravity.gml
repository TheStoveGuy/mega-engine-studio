///checkGroundGravity()
//Checks whether or not the object is on the ground

if place_meeting(x, y+global.GravityDir, objSolid)
|| place_meeting(x, y+global.GravityDir, objTopSolid)
|| place_meeting(x, y+global.GravityDir, prtMovingPlatformSolid) 
|| place_meeting(x, y+global.GravityDir, prtMovingPlatformJumpthrough)
|| place_meeting(x, y+global.GravityDir, objSlopeR) {
    if place_meeting(x, y+global.GravityDir, objSolid) {
        ground = true;
    }
    else if place_meeting(x, y+global.GravityDir, objSlopeR) {
        if !place_meeting(x, y-global.GravityDir*4, objSlopeR) {
            ground = true;
        while place_meeting(x,y,objSlopeR)
            y -= global.GravityDir;
        }
    else
    if place_meeting(xprevious, yprevious+global.GravityDir, objSlopeR)
    and place_meeting(x, y+global.GravityDir*8, objSolid)
        {
        ground = true;
        y += global.GravityDir;
        }
    }
    else if place_meeting(x, y+global.GravityDir, objTopSolid) {
        if bbox_bottom < instance_place(x, y+global.GravityDir, objTopSolid).bbox_top {
            ground = true;
        }
        else {ground = false;}
    }
    else if place_meeting(x, y+global.GravityDir, prtMovingPlatformSolid) {
        var sld;
        sld = instance_place(x, y+global.GravityDir, prtMovingPlatformSolid);
        if !sld.dead {
            ground = true;
        }
        else {ground = false;}
    }
    else {
        var sld;
        sld = instance_place(x, y+global.GravityDir, prtMovingPlatformJumpthrough);
        if !sld.dead {
            if bbox_bottom < sld.bbox_top {
                ground = true;
            }
            else {ground = false;}
        }
        else {ground = false;}
    }
}
else {
    ground = false;
}
