//Allow movement

x += xspeed;
y += yspeed;

//Stop movement at section borders
if x > (view_xview+view_wview)-6 && (!place_meeting(x, y, objSectionArrowRight))
{
    x = (view_xview+view_wview)-6;
    xspeed = 0;
    if place_meeting(x,y,objSolid)
    {
        global.playerHealth[player_id] = 0;
    }
    if place_meeting(x,y,prtMovingPlatformSolid)
    {
        if instance_place(x,y,prtMovingPlatformSolid).dead
        {
            global.playerHealth[player_id] = 0;
        }
    }
}
else if x < view_xview+6 && (!place_meeting(x, y, objSectionArrowLeft))
{
    x = view_xview+6;
    xspeed = 0;
    if place_meeting(x,y,objSolid)
    {
        global.playerHealth[player_id] = 0;
    }
    if place_meeting(x,y,prtMovingPlatformSolid)
    {
        if instance_place(x,y,prtMovingPlatformSolid).dead
        {
            global.playerHealth[player_id] = 0;
        }
    }
}

if global.GravityDir == 1
{
    if y < view_yview-32
    {
        y = view_yview-32;
    }
    else
    {
        if bbox_top > view_yview+view_hview && (place_meeting(x,y-8,objSectionPit) or !viewplayer or y > room_height)
        {
            global.playerHealth[player_id] = 0;
            deathByPit = true;
            global.LockTransition = 1;
        }
    }
}
else
{
    if y > view_yview+view_hview+32
    {
        y = view_yview+view_hview+32;
    }
    else
    {
        if bbox_bottom < view_yview && (place_meeting(x,y+8,objSectionPit) or !viewplayer or y < 0)
        {
            global.playerHealth[player_id] = 0;
            deathByPit = true;
            global.LockTransition = 1;
        }
    }
}
