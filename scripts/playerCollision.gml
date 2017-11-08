///playerCollision()
//Handles the player's collision code

var mySolid,that,this,val;
this = id;
mySolid = !canHit;

with objSpike {issolid = mySolid}
if canHit //Spikes
{
    if place_meeting(x, y, objSpike)
    {
        global.playerHealth[player_id] = 0;
    }
}

//Slope
mySolid = instance_place(x,y+global.GravityDir*4,objSlopeR)
if mySolid && yspeed*global.GravityDir >= 0 and collision_rectangle(x-1, y+(15*global.GravityDir)+yspeed+global.GravityDir+abs(xspeed*2), x+1, y+14*global.GravityDir, objSlopeR,1,1)
&& (!collision_rectangle(x-1, y+yspeed+global.GravityDir+abs(xspeed*2), x+1, y, mySolid,1,1) || ground) {
    if mySolid.issolid
    {
        while collision_rectangle(x-1+xspeed,y+(15*global.GravityDir), x+1+xspeed, y+(15/2)*global.GravityDir,objSlopeR,1,1)
        or place_meeting(x+xspeed,y+global.GravityDir,objSolid) && !place_meeting(x+xspeed,y-8*global.GravityDir,objSolid)
        {
            y -= global.GravityDir;
        }
        while !collision_rectangle(x-1+xspeed,y+(15*global.GravityDir)+global.GravityDir, x+1+xspeed, y+(15/2)*global.GravityDir,objSlopeR,1,1) 
        && collision_rectangle(x-1+xspeed,y+(15*global.GravityDir)+global.GravityDir, x+1+xspeed, y+(40)*global.GravityDir,objSlopeR,1,1) 
        && !place_meeting(x+xspeed,y+global.GravityDir,objSolid)
        {
            y += global.GravityDir;
        }
        if ground == false
        && playLandSound == true
        && (!place_meeting(x-image_xscale,y,objSolid) || abs(yspeed) > 1 || place_meeting(x-image_xscale,y-16*global.GravityDir,objSolid)) // don't play the landing noise if the player stepped off the edge of a solid block.
            playSFX(sfxLand);
        onSlope = true;
        playLandSoundTimer = -2;
        ground = true;
        yspeed = 0;
    }
    // determine what to do if the next x position doesn't have a slope
    if !collision_rectangle(x-1+xspeed, y+(15*global.GravityDir)+yspeed+global.GravityDir+abs(xspeed*2), x+1+xspeed, y+14*global.GravityDir, objSlopeR,1,1)
    {
        while place_meeting(x+xspeed,y+global.GravityDir*4,objSolid)
        and !place_meeting(x+xspeed,y+global.GravityDir,objSolid)
        {
            y += global.GravityDir;
            ground = true;
            playLandSound = false;
            playLandSoundTimer = 0;
            yspeed = 0;
        }
        while place_meeting(x+xspeed,y,objTopSolid)
        and !place_meeting(x+xspeed,y-global.GravityDir*4,objTopSolid)
        {
            y -= global.GravityDir;
            ground = true;
            yspeed = 0;
        }
        onSlope = false;
    }
}
else
{
    onSlope = false;
}

val = noone;
if xspeed != 0
{
    with objSolid
    {
        if issolid = 1
        { 
            that = id;
            with (this)
            {
                if place_meeting(x+xspeed, y, that)
                {
                    if xspeed < 0 {
                        if val < that.bbox_right or val = noone {val = that.bbox_right;}
                    }
                    else {
                        if val > that.bbox_left or val = noone {val = that.bbox_left;}
                    }
                }
            }
        }
    }
    with prtMovingPlatformSolid
    {
        if issolid = 1 && !dead
        { 
            that = id;
            with (this)
            {
                if place_meeting(x+xspeed, y, that)
                {
                    if xspeed < 0 {
                        if val < that.bbox_right or val = noone {val = that.bbox_right;}
                    }
                    else {
                        if val > that.bbox_left or val = noone {val = that.bbox_left;}
                    }
                }
            }
        }
    }
    
    if val != noone
    {
        if xspeed < 0 {
            x = val + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
        }
        else {
            x = val - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
        }
        xspeed = 0;
    }
}
    
val = noone;
if yspeed != 0 && !sinkin
{
    with objSolid
    {
        if issolid = 1
        {
            that = id;
            with (this)
            {
                if place_meeting(x, y+yspeed, that)
                {
                    if yspeed < 0 {
                        if val < that.bbox_bottom or val = noone {val = that.bbox_bottom;}
                    }
                    else {
                        if val > that.bbox_top or val = noone {val = that.bbox_top;}
                    }
                }
            }
        }
    }
    with prtMovingPlatformSolid
    {
        if issolid = 1 && !dead
        {
            that = id;
            with (this)
            {
                if place_meeting(x, y+yspeed, that)
                {
                    if yspeed < 0 {
                        if val < that.bbox_bottom or val = noone {val = that.bbox_bottom;}
                    }
                    else {
                        if val > that.bbox_top or val = noone {val = that.bbox_top;}
                    }
                }
            }
        }
    }
    
    //Jumpthrough platforms
    if yspeed*global.GravityDir > 0
    {
        with objTopSolid
        {
            if issolid = 1
            {
                that = id;
                with (this)
                {
                    if place_meeting(x, y+yspeed, that) && (!place_meeting(x, y, that) or clipup)
                    {
                        if yspeed < 0 {
                            if val < that.bbox_bottom or val = noone {val = that.bbox_bottom;}
                        }
                        else {
                            if val > that.bbox_top or val = noone {val = that.bbox_top;}
                        }
                    }
                }
            }
        }
        with prtMovingPlatformJumpthrough
        {
            if issolid = 1 && !dead
            {
                that = id;
                with (this)
                {
                    if place_meeting(x, y+yspeed, that) && (!place_meeting(x, y, that) or clipup)
                    {
                        if yspeed < 0 {
                            if val < that.bbox_bottom or val = noone {val = that.bbox_bottom;}
                        }
                        else {
                            if val > that.bbox_top or val = noone {val = that.bbox_top;}
                        }
                    }
                }
            }
        }
        with objPlayerPlatform
        {
            if issolid = 1 && !dead
            {
                that = id;
                with (this)
                {
                    if place_meeting(x, y+yspeed, that) && (!place_meeting(x, y, that) or clipup)
                    {
                        if yspeed < 0 {
                            if val < that.bbox_bottom or val = noone {val = that.bbox_bottom;}
                        }
                        else {
                            if val > that.bbox_top or val = noone {val = that.bbox_top;}
                        }
                    }
                }
            }
        }
    }
    
    if val != noone
    {
        if yspeed < 0 {
            y = val + sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index) + 1;
            if global.GravityDir = -1 {y += 9+1; if mask_index = mskMegamanSlide {y+=7;}}
        }
        else {
            y = val - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
            if global.GravityDir = -1 {y += 9;}
        }
        if yspeed*global.GravityDir > 0
        {
            ground = true;
            if playLandSound && !isHit && !climbing {playSFX(sfxLand);}
        }
        yspeed = 0;
    }
}

//StandSolid
mySolid = instance_place(x, y+yspeed, objStandSolid);
if mySolid && yspeed*global.GravityDir > 0 && !sinkin
{
    if mySolid.issolid {
        ground = true;
        yspeed = 0;
        //if playLandSound && !isHit && !climbing {playSFX(sfxLand);}
    }
}
