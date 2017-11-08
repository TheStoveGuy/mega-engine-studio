///checkGroundExt(gravity direction)
//Checks whether or not the object is on the ground

if place_meeting(x, y+argument0, objSolid)
|| place_meeting(x, y+argument0, objTopSolid)
|| place_meeting(x, y+argument0, prtMovingPlatformSolid) 
|| place_meeting(x, y+argument0, prtMovingPlatformJumpthrough)
|| place_meeting(x, y+argument0, objSlopeR) {
    if place_meeting(x, y+argument0, objSolid) {
        ground = true;
    }
    else if place_meeting(x, y+argument0, objSlopeR) {
        if !place_meeting(x, y-argument0*4, objSlopeR) {
            ground = true;
        while place_meeting(x,y,objSlopeR)
            y -= argument0;
        }
    else
    if place_meeting(xprevious, yprevious+argument0, objSlopeR)
    and place_meeting(x, y+argument0*8, objSolid)
        {
        ground = true;
        y += argument0;
        }
    }
    else if place_meeting(x, y+argument0, objTopSolid) {
        if (bbox_bottom < instance_place(x, y+argument0, objTopSolid).bbox_top && argument0 > 0)
        or (bbox_top < instance_place(x, y+argument0, objTopSolid).bbox_bottom && argument0 < 0){
            ground = true;
        }
        else {ground = false;}
    }
    else if place_meeting(x, y+argument0, prtMovingPlatformSolid) {
        var sld;
        sld = instance_place(x, y+argument0, prtMovingPlatformSolid);
        if !sld.dead {
            ground = true;
        }
        else {ground = false;}
    }
    else {
        var sld;
        sld = instance_place(x, y+argument0, prtMovingPlatformJumpthrough);
        if !sld.dead {
            if (bbox_bottom < sld.bbox_top && argument0 > 0)
            or (bbox_top < sld.bbox_bottom && argument0 < 0) {
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
