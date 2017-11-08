///playerHandleSprites(Animation Name)
if !canSpriteChange {exit;}

//setup animation variables
var AnimID;
AnimID = argument0
lastanimation = AnimID;

animate = 0;
spriteX = 0;
spriteY = 0;

//do animations
switch(AnimID)
{
    case "Normal": //Regular animation stuff
        animNameID = 0; //Standing
        if isHit or isfrozen //Hurt
        {
            animNameID = 5;
        }
        else if climbing //Climbing
        {
            animNameID = 4+(climbing = 2)*3;
        }
        else if isSlide //Sliding
        {
            animNameID = 6;
        }
        else if ground
        {
            if canMove || fanoutDistance != 0
            {
                if !canInitStep
                {
                    if !isStep //Walking
                    {
                        animNameID = 2;
                    }
                    else //Pixel step
                    {
                        animNameID = 1;
                    }
                }
            }
        }
        else //Jumping
        {
            animNameID = 3;
        }
        
        if animNameID = 0 //Stand
        {
            blinkTimer += 1;
            blinkImage = ((blinkTimer mod blinkTimerMax+blinkDuration+1) >= blinkTimerMax);
        }
        else
        {
            blinkTimer = 0;
            blinkImage = 0;
        }
        spriteY = isShoot;
        
        switch(animNameID)
        {
            case 0: //Stand
                spriteX = blinkImage;
                break;
            case 1: //Pixel Step
                spriteX = 2;
                break;
            case 2: //Walking
                spriteLoopStart = 0;
                spriteLoopEnd = 3;
                spriteIDX[0] = 3;
                spriteIDX[1] = 4;
                spriteIDX[2] = 5;
                spriteIDX[3] = 6;
                spriteLoopPoint = 0;
                spriteLoopSpeed = 0.15;
                spriteX = spriteIDX[floor(spriteLoopID)];
                animate = 1;
                break;
            case 3: //Jumping
                spriteLoopStart = 0;
                spriteLoopEnd = 3;
                spriteLoopPoint = 2;
                spriteIDX[0] = 7;
                spriteIDX[1] = 8;
                spriteIDX[2] = 9;
                spriteIDX[3] = 10;
                spriteLoopSpeed = 0.3;
                if yspeed < 0 //jumping
                {
                    spriteLoopEnd = 1;
                    spriteLoopPoint = 0;
                }
                else //Falling
                {
                    spriteLoopEnd = 3;
                    spriteLoopPoint = 2;
                }
                spriteX = spriteIDX[floor(spriteLoopID)];
                animate = 1;
                break;
            case 4: //Climbing
                spriteX = 15;
                if instance_exists(objSectionSwitcher)
                {
                    climbSpriteTimer += 1;
                    if climbSpriteTimer >= 8 && !isShoot
                    {
                        climbSpriteTimer = 0;
                        image_xscale = -image_xscale;
                    }
                }
                break;
            case 5: //Hit
                spriteX = 13+(canHit=true)-isfrozen;
                break;
            case 6: //Sliding
                spriteLoopStart = 0;
                spriteLoopEnd = 1;
                spriteLoopPoint = 0;
                spriteIDX[0] = 11;
                spriteIDX[1] = 12;
                spriteX = spriteIDX[floor(spriteLoopID)];
                animate = 1;
                break;
            case 7: //Climbing top
                spriteX = 17;
                break;
            case 8: //Stun
                spriteX = 13;
                break;
        }
        
        //LookUp
        if global.weapon[player_id] == wire && !isShoot
        {
            if (global.keyUp[player_id] && global.GravityDir >= 0)
            || (global.keyDown[player_id] && global.GravityDir < 0)
            {
                spriteY = 15;
            }
        }
        break;
    
    // - E X T R A    A N I M A T I O N    S T U F F - //
    
    case "Slash":
        if climbing {
            spriteX = 28;
        }
        else if ground {
            spriteX = 26;
        }
        else {
            spriteX = 27;
        }
        if instance_exists(objSlashClaw) {
            var spry;
            spry = round(objSlashClaw.image_index);
            if spry > 3 {spry = 3;}
            spriteY = spry;
        }
        break;
    case "Talk":
        break;
    case "Teleport":
        spriteX = 24+teleportImg;
        spriteY = 5;
        break;
    case "Spin":
        animSpinOffset += 0.125;
        if animSpinOffset >= 5
        {
            animSpinTurn *= -1;
            animSpinOffset = 0;
        }
        spriteX = (21-animSpinTurn*2)+(floor(animSpinOffset)*animSpinTurn);
        spriteY = 4+(animSpinTurn=1);
        break;
    case "Bike":
        spriteX = 27+blinkImage;
        spriteY = 6;
        break;
    case "Sakugarne0":
        spriteX = 27;
        spriteY = 5;
        break;
    case "Sakugarne1":
        spriteX = 28;
        spriteY = 5;
        break;
    case "Magnet":
        spriteY = 8-other.spry;
        spriteX = other.sprx;
        break;
    case "Wire":
        spriteY = 15;
        if ground or other.phase = 1 
        {
            spriteX = 18;
        }
        else {spriteX = 19+isShoot;}
        break;
}

if animate //Animation
{
    if spriteLoopID < spriteLoopEnd+1
    {
        spriteLoopID += spriteLoopSpeed;
    }
    if spriteLoopID >= spriteLoopEnd+1
    {
        spriteLoopID = spriteLoopPoint;
    }
}

/*
0 = stand
1 = side step
2 = walk
3 = jump
4 = climb
5 = hurt
6 = slide
7 = climbTop
*/
