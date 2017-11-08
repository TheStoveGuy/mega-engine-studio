///generalCollision()
//Handles a general object's collision code. The object cannot have a specified mask. If it does, use generalCollisionMask()

var mySolid,myxspeed,myyspeed;
myxspeed = xspeed;
if xspeed > -1 && xspeed < 1 {
    myxspeed = sign(xspeed);
}
myyspeed = yspeed;
if yspeed > -1 && yspeed < 1 {
    myyspeed = sign(yspeed);
}

if xspeed != 0 {
    //Wall
    mySolid = instance_place(x+myxspeed, y, objSolid);
    if mySolid {
        if xspeed < 0 {
            //x = mySolid.bbox_right + (x - (bbox_left-1))//-1;
            x = mySolid.bbox_right;
            while place_meeting(x, y, mySolid) {x += 1;}
        }
        else {
            //x = mySolid.bbox_left - (bbox_right+1 - x)-1;
            x = mySolid.bbox_left;
            while place_meeting(x, y, mySolid) {x -= 1;}
        }
        xspeed = 0;
    }
    
    //Wall (moving platform)
    mySolid = instance_place(x+myxspeed, y, prtMovingPlatformSolid);
    if mySolid && xspeed != 0 {    
        if !mySolid.dead {
            if xspeed < 0 {
                //x = mySolid.bbox_right + (x - (bbox_left-1));
                x = mySolid.bbox_right;
                while place_meeting(x, y, mySolid) {x += 1;}
            }
            else {
                //x = mySolid.bbox_left - (bbox_right+1 - x);
                x = mySolid.bbox_left;
                while place_meeting(x, y, mySolid) {x -= 1;}
            }
            xspeed = 0;
        }
    }
}

if yspeed > 0 {
    //Floor
    mySolid = instance_place(x, y+myyspeed, objSolid);
    if mySolid {
        y = mySolid.bbox_top;
        while place_meeting(x, y, mySolid) {y -= 1;}
        ground = true;
        yspeed = 0;
    }
    
    //Topsolids
    mySolid = instance_place(x, y+myyspeed, objTopSolid);
    if mySolid {
        if !place_meeting(x, y, mySolid) {
            //y = mySolid.bbox_top - (bbox_bottom+1 - y);
            y = mySolid.bbox_top;
            while place_meeting(x, y, mySolid) {y -= 1;}
            ground = true;
            yspeed = 0;
        }
    }
    
    //Floor (moving platform)
    var mySolid;
    mySolid = instance_place(x, y+myyspeed, prtMovingPlatformSolid);
    if mySolid {
        if !mySolid.dead {
            y = mySolid.bbox_top;
            while place_meeting(x, y, mySolid) {y -= 1;}
            ground = true;
            yspeed = 0;
        }
    }
    
    //Topsolids (moving platform)
    mySolid = instance_place(x, y+myyspeed, prtMovingPlatformJumpthrough);
    if mySolid {
        if !mySolid.dead {
            if !place_meeting(x, y, mySolid) {
                //y = mySolid.bbox_top - (bbox_bottom+1 - y);
                y = mySolid.bbox_top;
                while place_meeting(x, y, mySolid) {y -= 1;}
                ground = true;
                yspeed = 0;
            }
        }
    }
}

if yspeed < 0 {
    //Ceiling
    mySolid = instance_place(x, y+myyspeed, objSolid);
    if mySolid {
        //y = mySolid.bbox_bottom + (y - (bbox_top-1));
        y = mySolid.bbox_bottom;
        while place_meeting(x, y, mySolid) {y += 1;}
        yspeed = 0;
    }
    
    //Ceiling (moving platform)
    mySolid = instance_place(x, y+myyspeed, prtMovingPlatformSolid);
    if mySolid {
        if !mySolid.dead {
            //y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index);
            y = mySolid.bbox_bottom;
            while place_meeting(x, y, mySolid) {y += 1;}
            yspeed = 0;
        }
    }
}
