///playerTimeStopped()
//Locks the player's movement

with objMegaman
{
    isStep = false;
    climbing = false;
    canGravity = false;
    isShoot = 0;
    shootStandstill = false;
    canMove = false;
    isSlide = false;
    canPause = false;
    onRushJet = false;
    mask_index = mskMegaman;
    
    xspeed = 0;
    yspeed = 0;
    
    global.timeStopped = true;
}
