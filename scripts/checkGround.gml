///checkGround()
//Checks whether or not the object is on the ground

//if !ground {exit;}

ground = false;

if place_meeting(x, y+1, objSolid)
{
    ground = true;
}

if place_meeting(x, y+1, objSlopeR)
{
    if !place_meeting(x, y-4, objSlopeR)
    {
        ground = true;
        while place_meeting(x,y,objSlopeR)
        {
            y -= 1;
        }
    }
    else if place_meeting(xprevious, yprevious+1, objSlopeR)
    && place_meeting(x, y+8, objSolid)
    {
        ground = true;
        y += 1;
        exit;
    }
}

var sld;

if place_meeting(x, y+1, objTopSolid)
{
    sld = instance_place(x, y+1, objTopSolid);
    if !place_meeting(x,y,sld)
    {
        ground = true; exit;
    }
}

if place_meeting(x, y+1, prtMovingPlatformSolid)
{
    sld = instance_place(x, y+1, prtMovingPlatformSolid);
    if !sld.dead
    {
        ground = true; exit;
    }
}

if place_meeting(x, y+1, prtMovingPlatformJumpthrough)
{
    sld = instance_place(x, y+1, prtMovingPlatformJumpthrough);
    if !sld.dead
    {
        if !place_meeting(x,y,sld)
        {
            ground = true; exit;
        }
    }
}
