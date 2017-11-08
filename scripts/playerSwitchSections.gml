///playerSwitchSections()
//Moving from one section to the next, if possible

//newSectionXOffset/newSectionYOffset are used to get the right section borders in the new section
//Taking the normal X/Y coordinate would result in rounding errors in playerCameraInit(),
//which could either cause the game to freeze or the wrong section borders to be used
//Using 16 or 32 instead of 64 would also occassionally cause these problems, probably because of the +6/-6

if global.LockTransition {exit;}

//Right
if x > global.sectionRight-8 && place_meeting(x-xspeed+6, y, objSectionArrowRight)
&& !place_meeting(global.sectionRight,y,objSolid)
{
    x = global.sectionRight-6;
    playerCameraInit(64,(view_yview[0]+view_hview[0]*0.5)-y);
    with instance_create(x, y, objSectionSwitcher) {dir = "x"; num = 1;}
}

//Left
else if x < global.sectionLeft+8 && place_meeting(x-xspeed-6, y, objSectionArrowLeft)
&& !place_meeting(global.sectionLeft,y,objSolid)
{
    x = global.sectionLeft+6;
    playerCameraInit(-64,(view_yview[0]+view_hview[0]*0.5)-y);
    with instance_create(x, y, objSectionSwitcher) {dir = "x"; num = -1;}
}

//Down
else if (bbox_get_ycenter() > global.sectionBottom-6 || ((place_meeting(x,y+2,prtMovingPlatformSolid) || place_meeting(x,y+2,prtMovingPlatformJumpthrough)) && bbox_get_ycenter() > global.sectionBottom-22 ))
&& !place_meeting(x, bbox_get_ycenter()-yspeed+6, objSectionPit)
&& (climbing || global.GravityDir == 1 || place_meeting(x,y-2,prtMovingPlatformJumpthrough) || place_meeting(x,y-2,prtMovingPlatformSolid))
&& view_yview+view_hview < room_height
&& !place_meeting(x,global.sectionBottom,objSolid)
{
    if !place_meeting(x,y+2*global.GravityDir,prtMovingPlatformJumpthrough) 
    && !place_meeting(x,y+2*global.GravityDir,prtMovingPlatformSolid)
    {
        y  = global.sectionBottom-6 + sprite_yoffset - (sprite_height/2);
    }
    playerCameraInit(0,64);
    with instance_create(x, y, objSectionSwitcher) {dir = "y"; num = 1;}
}

//Up
else if bbox_get_ycenter() < global.sectionTop+6 && !place_meeting(x, bbox_get_ycenter()-yspeed+6, objSectionPit)
&& (climbing || global.GravityDir == -1 || place_meeting(x,y+2,prtMovingPlatformJumpthrough) || place_meeting(x,y+2,prtMovingPlatformSolid))
&& view_yview > 0
&& !place_meeting(x,global.sectionTop,objSolid)
{
    if !place_meeting(x,y+2*global.GravityDir,prtMovingPlatformJumpthrough) 
    && !place_meeting(x,y+2*global.GravityDir,prtMovingPlatformSolid)
    {
        y  = global.sectionTop+6 + sprite_yoffset - (sprite_height/2);
    }
    playerCameraInit(0,-64);
    with instance_create(x, y, objSectionSwitcher) {dir = "y"; num = -1;}
}
