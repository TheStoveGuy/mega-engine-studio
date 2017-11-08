///playerGetShocked(ignore ground, additional time)
//Call it like this: with objMegaman playerGetShocked();
//Makes the player get shocked

var _IgnoreGround;
_IgnoreGround = argument0;

if canHit && !isHit && (_IgnoreGround || ground)
{
    isHit = true;
    hitTimer = 0;
    isStep = false;
    climbing = false;
    canGravity = true;
    isShoot = 0;
    shootStandstill = false;
    onRushJet = false;
    shootTimer = 0-argument1;
    
    //When sliding and there's a solid above us, we should not experience knockback
    //If we did, we would clip inside the ceiling above us
    if !(isSlide && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
    {
        canMove = false;
        isSlide = false;
        mask_index = mskMegaman;
        
        xspeed = image_xscale * -0.5;
        if yspeed*global.GravityDir<=0
        {
            yspeed = -1*global.GravityDir;
        }
        else {yspeed = 0;}
    }
}
