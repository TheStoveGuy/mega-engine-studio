///solid_at(dst_x,dst_y, [src_x = x, src_y = y, [gravityDir = 1]])
// checks to see if there is a solid-like object at the given location
// similar to place_meeting(x,y,objSolid) but checks for other kinds of solids too, taking into account
// directionality
// src_x,src_y, and gravityDir matter for passing through top solids

var dst_x, dst_y, src_x, src_y, gvec;

// read in args
dst_x = argument[0]
dst_y = argument[1]

if argument_count > 2 {
    src_x = argument[2]
    src_y = argument[3]
} else {
    src_x = x;
    src_y = y;
}

if argument_count > 4
    gvec = argument[4]
else
    gvec = 1;
    
// check for solids

if place_meeting(dst_x,dst_y,objSolid)
    return true;
if place_meeting(dst_x,dst_y,prtMovingPlatformSolid)
    return true;
    
// passthrough objects
if ((dst_y - src_y) * gvec > 0) {
    //stand solid:
    if place_meeting(dst_x,dst_y,objStandSolid)
        return true;
    
    //jumpthrough
    pos_y = bbox_top;
    if gvec > 0
        pos_y = bbox_bottom;
    if jumpthrough_solid_check(dst_x - src_x, pos_y, pos_y + (dst_x - src_x), gvec, prtMovingPlatformJumpthrough)
        return true;
    if jumpthrough_solid_check(dst_y - src_y, pos_y, pos_y + (dst_x - src_x), gvec, objTopSolid)
        return true;
}
    
return false;
