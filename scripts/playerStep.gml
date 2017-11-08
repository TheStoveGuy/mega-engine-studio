///playerStep()
//Handles general step event code for the player

//Should the landing sound be played when colliding with a floor? (Disabled on ladders, for example)
//Lasts two frames because one extra frame is required for the collision to register
if playLandSoundTimer < 2
{
    playLandSoundTimer += 1;
}
else {playLandSound = true;}

hdir = -global.keyLeft[player_id]+global.keyRight[player_id];
vdir = -global.keyUp[player_id]  +global.keyDown[player_id];

//Movement (includes initializing sidestep while on the ground)
if canMove
{
    if canturn && hdir != 0
    {
        image_xscale = hdir;
    }
    if ground { //Walk on the ground
        if hdir != 0 {
            if canInitStep
            {
                canInitStep = false;
                isStep = true;
            }
            else if !isStep
            {
                if place_meeting(x, y+global.GravityDir, objIce) //Ice
                {
                    if xspeed*image_xscale < walkSpeed
                    {
                        xspeed += iceDec*hdir;
                    }
                }
                else if (place_meeting(x, y+global.GravityDir, objOil)) { //Oil
                    xspeed = oilWalk*hdir;
                }
                else { //Normal
                    xspeed = walkSpeed*hdir;
                }
            }
        }
        else {
            if !(place_meeting(x, y+global.GravityDir, objIce) && xspeed != 0)
            {
                //Normal physics
                xspeed = 0;
                canInitStep = true;
            }
            else {
                //Ice physics
                if xspeed != 0 {
                    xspeed -= iceDec*sign(xspeed);
                    if xspeed > -iceDec && xspeed < iceDec {
                        xspeed = 0;
                    }
                }
            }
        }
    }
    else { //Move in the air
        canInitStep = false;
        isStep = false;
        xspeed = walkSpeed*hdir;
    }
}

//Sidestepping
if isStep {
    if (!place_meeting(x+image_xscale, y, objSolid) || onSlope) && !place_meeting(x+image_xscale, y, prtMovingPlatformSolid) {
        xspeed = stepSpeed * image_xscale;
    }
    else if place_meeting(x+image_xscale, y, prtMovingPlatformSolid) {
        if instance_place(x+image_xscale, y, prtMovingPlatformSolid).dead { //Still allow movement when the moving platform is despawned
            xspeed = stepSpeed * image_xscale;
        }
    }
    stepTimer += 1;
    if stepTimer >= stepFrames {
        isStep = false;
        stepTimer = 0;
    }
}

//Jumping
if (canMove || shootStandstill || onRushJet) && ground && global.keyJumpPressed[player_id] && vdir!=global.GravityDir {
    if shootStandstill //We can jump-cancel the throwing animation
    {
        canMove = true;
    }
    else if onRushJet
    {
        canMove = true;
    }
    yspeed = -currentJumpSpeed*global.GravityDir;
    ground = false;
    canMinJump = true; //change this so that you have to press jump to do a min jump
    y -= global.GravityDir; //To negate the prevGround y += 1
}

//Minjumping (lowering jump when the jump button is released)
if !ground && yspeed*global.GravityDir < 0 && !global.keyJump[player_id] && canMinJump
{
    canMinJump = false;
    yspeed = 0;
}

var box;
if image_xscale == 1 {
    box = bbox_right;
}
else {box = bbox_left;}
if global.GravityDir > 0 {
    bbox = bbox_bottom;
}
else {bbox = bbox_top;}

//Sliding
if global.enableSlide
{
    if (ground || onSlope) && !isSlide && canMove
    && ((global.keyJumpPressed[player_id] && vdir = global.GravityDir) || (global.keySlidePressed[player_id]))
    {
        premask = mask_index;
        mask_index = mskMegamanSlide;
        var canSld; canSld = true;
        if place_meeting(x+image_xscale,y,objSolid) {
            canSld = false;
        }
        if place_meeting(x+image_xscale,y,prtMovingPlatformSolid) {
            if instance_place(x+image_xscale,y,prtMovingPlatformSolid).dead { //We can still slide if the moving platform is despawned
                canSld = false;
            }
        }
        if canSld
        {
            isSlide = true;
            slideTimer = 0;
            canMove = false;
            if image_xscale == -1 {
                with instance_create(bbox_right-2, bbox-2*global.GravityDir, objSlideDust) image_xscale = -1;
            }
            else {
                instance_create(bbox_left+2, bbox-2*global.GravityDir, objSlideDust);
            }
            xspeed = slideSpeed * image_xscale;
        }
        else {
            mask_index = premask;
        }
    }
    
    //While sliding
    if isSlide
    {
        isStep = false;
        canInitStep = false;
        stopSld = 0;
        slideTimer += 1;
        
        var canProceed,isfree;
        canProceed = true;
        isfree = true;
        
        if image_xscale == -hdir || slideTimer >= slideFrames || (global.keyJumpPressed[player_id] && vdir != global.GravityDir)
        {
            canProceed = false;
        }
        
        mask_index = premask;
        if place_meeting(x,y,objSolid) {
            canProceed = true;
            isfree = false;
        }
        if place_meeting(x,y,prtMovingPlatformSolid) {
            if !instance_place(x,y,prtMovingPlatformSolid).dead {
                canProceed = true;
                isfree = false;
            }
        }
        
        if xspeed = 0
        {
            canProceed = false;
            if !ground
            {
                isfree = true;
            }
        }
        if !ground
        {
            mask_index = mskMegamanSlide2;
            ground = true;
            playerGround();
            if !ground
            {
                canProceed = false;
                isfree = true;
            }
            mask_index = mskMegamanSlide;
        }
        
        if !canProceed && isfree //Stop sliding
        {
            isSlide = false;
            canMove = true;
            slideTimer = 0;
            
            ground = true;
            playerGround();
            
            mask_index = premask;
            if !ground //Pushing down until not inside a ceiling anymore
            {
                while place_meeting(x,y,objSpike) {y += global.GravityDir;}
                ys = yspeed;
                xs = xspeed;
                yspeed = -global.GravityDir
                xspeed = 0;
                playerCollision();
                yspeed = ys;
                xspeed = xs;
            }
            
            if !place_meeting(x, y+global.GravityDir, objIce)
            {
                xspeed = 0;
            }
            
            if global.keyJumpPressed[player_id] && vdir!=global.GravityDir
            {
                canMinJump = true;
                yspeed = -jumpSpeed*global.GravityDir;
                ground = false;
            }
        }
        else //Continue sliding
        {
            if hdir != 0 && canturn
            {
                image_xscale = hdir;
            }
            xspeed = slideSpeed*image_xscale;
            if isHit
            {
                xspeed = 0;
            }
            mask_index = mskMegamanSlide;
        }
    }
}

//Climbing
var ladder, ladderDown;
ladder = collision_line(sprite_get_xcenter(), bbox_top+2, sprite_get_xcenter(), bbox_bottom, objLadder, false, false);
ladderDown = 0;

if global.GravityDir == 1
{
    ladderDown = instance_position(sprite_get_xcenter(),bbox_bottom+1,objLadder);
}
else
{
    ladderDown = instance_position(sprite_get_xcenter(),bbox_top-1,objLadder);
}

if ((ladder >= 0 && global.GravityDir == -vdir) || (ladderDown >= 0 && ground && global.GravityDir == vdir && !place_meeting(x, y, objLadder))) 
&& (canMove || isSlide) && !place_meeting(x,y,objSakugarne) //can't climb ladders while super saiyan flying (it's glitchy, and it makes enough sense to have this restriction, so
{
    xspeed = 0;
    
    if isSlide && global.GravityDir == vdir
    {
        isSlide = false;
        mask_index = mskMegaman;
        slideTimer = 0;
        ys = yspeed;
        xs = xspeed;
        yspeed = -global.GravityDir
        xspeed = 0;
        playerCollision();
        yspeed = ys;
        xspeed = xs;
    }
    
    climbing = true;
    
    if ladder >= 0
    {
        xspeed = ladder.x+8-x;
        playerCollision();
        x += xspeed;
        xspeed = 0;
        
        if x != ladder.x+8
        {
            climbing = false;
        }
    }
    else if ladderDown >= 0
    {
        x = ladderDown.x+8;
        y += climbSpeed*global.GravityDir;
    }
    
    if climbing
    {
        canMove = false;
        canGravity = false;
        ground = false;
        yspeed = 0;
        ladderXScale = image_xscale;
        climbShootXscale = ladderXScale;
    }
}

//While climbing
if climbing
{
    isStep = false;
    canInitStep = false;
    
    //Movement
    if vdir != 0 && !isShoot
    {
        climbSpriteTimer += 1;
        yspeed = climbSpeed*vdir;
    }
    else
    {
        yspeed = 0;
    }
    
    //Left/right
    if hdir != 0
    {
        climbShootXscale = hdir;
    }
    if climbSpriteTimer >= 8 && !isShoot
    {
        climbSpriteTimer = 0;
        image_xscale = -image_xscale;
    }
    
    //Getup sprite
    if !position_meeting(x,bbox_top*(global.GravityDir=1)+bbox_bottom*(global.GravityDir=-1)+11*global.GravityDir, objLadder)
    &&  position_meeting(x,bbox_bottom*(global.GravityDir=1)+bbox_top*(global.GravityDir=-1)+global.GravityDir, objLadder) //The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
    {
        climbing = 2;
        if !isShoot
        {
            image_xscale = 1;
        }
    }
    else 
    {
        climbing = 1;
    }
    
    //Releasing the ladder
    if (ground && vdir*global.GravityDir) || !place_meeting(x, y, objLadder) || (global.keyJumpPressed[player_id] && vdir != -global.GravityDir)
    {
        climbing = false;
        canMove = true;
        canGravity = true;
        image_xscale = ladderXScale;
        yspeed = 0;
        ground = 1;
        if place_meeting(x, y+climbSpeed*global.GravityDir, objLadder)
        {
            yspeed = climbSpeed*global.GravityDir;
            playLandSound = false;
            playLandSoundTimer = 0;
        }
    }
}

//Water
if !showReady {
    if inWater {
        bubbleTimer += 1;
        if bubbleTimer >= 64 {
            bubbleTimer = 0;
            if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,objWater,false,false) {
                instance_create(x, y, objAirBubble);
            }
        }
        if y-4 >= view_yview && y+4 <= view_yview+view_hview {
            var wtr, splash;
            if place_meeting(x,y-yspeed,objWater) && !place_meeting(x,y,objWater)
            {
                wtr = instance_place(x,y-yspeed,objWater);
                if wtr 
                {
                    if bbox_bottom < wtr.bbox_top { //&& !collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,objWater,false,false) {
                        inWater = false;
                        playSFX(sfxSplash);
                        instance_create(x, wtr.bbox_top+1, objSplash);
                    }
                    if bbox_top > wtr.bbox_bottom { //&& !collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom,objWater,false,false) {
                        inWater = false;
                        playSFX(sfxSplash);
                        splash = instance_create(x, wtr.bbox_bottom, objSplash);
                        splash.image_yscale = -1;
                    }
                }
            }
            else if !place_meeting(x,y,objWater)
            {
                inWater = false;
            }
        }
        if !inWater
        {
            currentGrav = grav;
            currentJumpSpeed = jumpSpeed;
            bubbleTimer = 0;
        }
    }
    else if place_meeting(x,y,objWater) {
        var wtr, splash;
        wtr = instance_place(x, y, objWater);
        if wtr
        {
            inWater = true;
            currentGrav = gravWater;
            currentJumpSpeed = jumpSpeedWater;
            wtr = instance_place(x, y, objWater);
            if wtr.bbox_top > bbox_top && !collision_line(bbox_left,bbox_top,bbox_right,bbox_top,objWater,false,false) {
                instance_create(x, wtr.bbox_top+1, objSplash);
                playSFX(sfxSplash);
            }
            if wtr.bbox_bottom < bbox_bottom && !collision_line(bbox_left,bbox_bottom,bbox_right,bbox_bottom,objWater,false,false) {
                splash = instance_create(x, wtr.bbox_bottom, objSplash);
                splash.image_yscale = -1;
                playSFX(sfxSplash);
            }
        }
    }
}
//Oil
if !teleporting && !showReady {
    if (place_meeting(x, y, objOil) && !place_meeting(x, y-yspeed, objOil))
    or (!place_meeting(x, y, objOil) && place_meeting(x, y-yspeed, objOil)){
        var wtr;
        if place_meeting(x, y, objOil) {
            wtr = instance_place(x, y, objOil);
        }
        else {
            wtr = instance_place(x, y-yspeed, objOil);
        }
        if !wtr.fire {
            with wtr event_user(1);
        }
    }
}
//While being hit
if isHit
{
    if canHit && ground && hitTimer < hitTime-5
    {
        yspeed = -1*global.GravityDir;
    }
    hitTimer += 1;
    if hitTimer >= hitTime
    {
        isHit = false;
        drawHitspark = false;
        hitTimer = 0;
        //When sliding and there's a solid above us, we should not experience knockback
        //If we did, we would clip inside the ceiling above us
        if !(isSlide && (place_meeting(x, y-3*global.GravityDir, objSolid) || place_meeting(x, y-3*global.GravityDir, prtMovingPlatformSolid)))
        {
            canMove = true;
        }
        if !canHit
        {
            invincibilityTimer = 60+global.sturdyHelmet*30;
        }
    }
    else
    {
        if !canHit
        {
            drawHitspark = ((hitTimer mod 8) <= 3);
        }
    }
}

//Invincibility
if invincibilityTimer
{
    invincibilityTimer -= 1;
    if !invincibilityTimer
    {
        invincibilityTimer = 0;
        canHit = true;
        visible = true;
    }
    else
    {
        visible = (invincibilityTimer mod 4 < 2)
    }
}

//Gravity
if !ground && canGravity
{
    yspeed += currentGrav*gravfactor*global.GravityDir;
    if yspeed*global.GravityDir > maxVspeed
    {
        yspeed = maxVspeed*global.GravityDir;
    }
    if yspeed*global.GravityDir > 0
    {
        canMinJump = false; //change this so that you have to press jump to do a min jump
    }
}

//Misc
if visible && inWaveBike
{
    inWaveBike = false;
}

//Variables on the previous frame
prevGround = ground;
prevXScale = image_xscale;

//Being frozen
if isfrozen
{
    freezetimer -= 1;
    playerTimeStopped();
    if !freezetimer or isHit
    {
        isfrozen = 0;
        playerTimeRestored();
        event_user(0);
        canSpriteChange = 1;
        shootStandstill = false;
        isShoot = 0;
        shootTimer = 0;
    }
}
