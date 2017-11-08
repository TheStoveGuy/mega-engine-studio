//Check for ground
hasground = false;

// spikes depend on this player's canHit
var mySolid = 1;
if canHit
{
    mySolid = 2;
}

with objSpike {issolid = mySolid}
with objSolid
{
    if issolid == 1
    {
        if place_meeting(x, y - other.yspeed - global.GravityDir, other)
        {
            other.hasground = true
        }
    }
}

//objStandSolid
if place_meeting(x, y+yspeed+global.GravityDir, objStandSolid)
{
    hasground = true;
}

//objTopSolid
with objTopSolid
{
    if place_meeting(x,y-global.GravityDir,other.id)
    {
        if !place_meeting(x,y,other.id)
        {
            other.hasground = true;
        }
    }
}

//MovingPlatformSolid
with prtMovingPlatformSolid
{
    if !dead && issolid
    {
        if place_meeting(x,y-global.GravityDir*2,other.id)
        {
            other.hasground = true;
        }
    }
}

//MovingPlatformJumpthrough
with prtMovingPlatformJumpthrough {
    if !dead && issolid {
        if place_meeting(x,y-global.GravityDir*2,other.id) {
            if !place_meeting(x,y,other.id) {
                other.hasground = true;
            }
        }
    }
}

//MovingPlatformJumpthrough
with objPlayerPlatform {
    if !dead && issolid {
        if place_meeting(x,y-global.GravityDir*2,other.id) {
            if !place_meeting(x,y,other.id) {
                other.hasground = true;
            }
        }
    }
}

//Slope
if collision_rectangle(x-1, y+(15*global.GravityDir)+yspeed+global.GravityDir+abs(xspeed*2), x+1, y+14*global.GravityDir, objSlopeR,1,1)
{
    hasground = true;
}

if !hasground {ground = false;}
