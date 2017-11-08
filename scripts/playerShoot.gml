///playerShoot()
//Handles Mega Man's shooting

global.playerProjectileCreator = id;

//Shooting
if global.keyShootPressed[player_id] && canShoot && (canMove || climbing || shootStandstill || onRushJet)
&& (global.ammo[player_id,global.weapon[player_id]] > 0 || global.flashStopper)
{
    switch (global.weapon[player_id])
    {
        case 0: //Mega Buster
            if global.lockBuster {playSFX(sfxError);}
            else
            {
                i = fireWeapon(16,0,objBusterShot,3+global.shotUpgrade*10,0,1,0);
                if i
                {
                    i.xspeed = image_xscale*5;
                }
            }
            break;
        case 1: //Hornet Chaser
            i = fireWeapon(14,-3,objHornetChaser,3,1.5,1,0);
            if i
            {
                i.direction = 30+(120*(image_xscale=-1));
            }
            break;
        case 2: //Jewel Satellite
            if bullets = 0
            {
                    for(z = 0; z < 4; z += 1)
                    {
                        i = fireWeapon(0, 0, objJewelSatellite, 1, 4 * (z == 0), 0, 0);
                        if (i)
                        {
                            i.direction = z * 90;
                        }
                    }
                    
                    for(z = 0; z < 4; z += 1)
                    {
                        i = fireWeapon(0, 0, objJewelSatellite, 1, 0, 0, 0);
                        if (i)
                        {
                            i.direction = z * 90 + 45;
                            i.visible = 0;
                        }
                    }
            }
            break;
        case 3: //Grab Buster
            i = fireWeapon(13,0,objGrabBuster,3,2,1,0);
            if i
            {
                i.xspeed = image_xscale * 2;
            }
            break;
        case 4: //Triple Blade
            for (z=0; z<=2; z+=1;)
            {
                toss_up = ground;
                if global.GravityDir = -1 {
                    toss_up = !toss_up
                }
                i = fireWeapon(16,0,objTripleBlade,1,1*(z=0),1,0);
                if i
                {
                    i.image_index = z;
                    if image_xscale = -1
                    {
                        i.direction += 180;
                    }
                    if toss_up {
                        i.direction += z*15*image_xscale;
                    }
                    else {
                        i.direction -= z*15*image_xscale;
                        if z>0 {i.image_index += 2;}
                    }
                    with i
                    {
                        motion_set(direction,5);
                    }
                }
            }
            break;
        case 5: //Flash Stopper
            if !instance_exists(objFlashStopper)
            {
                fireWeapon(0,0,objFlashStopper,0,7,0,0);
            }
            else
            {
                //normal
                i = fireWeapon(14,0,objBusterShot,4,0,1,0);
                if i
                {
                    i.xspeed = image_xscale * 5;
                }
            }
            break;
        case 6: //Slash Claw
            fireWeapon(5,-2,objSlashClaw,1,1,1,1);
            break;
        case 7: //Wheel Cutter
            if !isShoot
            {
                i = fireWeapon(13,0,objWheelCutter,3,1,1,0);
            }
            break;
        case 8: //Sakugarne
            i = fireWeapon(26,0,objRushTeleport,1,0,0,0);
            if i
            {
                i.type = 'sakugarne';
                i.y = view_yview;
            }
            break;
        case 9: //Rush Coil
            if !instance_exists(objRushCoil) && !instance_exists(objRushTeleport)
            {
                i = fireWeapon(26,0,objRushTeleport,4,0,0,0);
                if i
                {
                    i.type = 'coil';
                    i.y = view_yview;
                }
            }
            else
            {
                i = fireWeapon(16,0,objBusterShot,4,0,1,0);
                if i
                {
                    i.xspeed = image_xscale * 5;
                }
            }
            break;
        case 10: //Rush Jet
            if !instance_exists(objRushJet) && !instance_exists(objRushTeleport)
            {
                i = fireWeapon(26,0,objRushTeleport,4,0,0,0);
                if i
                {
                    i.type = 'jet';
                    i.y = view_yview;
                }
            }
            else
            {
                i = fireWeapon(16,0,objBusterShot,4,0,1,0);
                if i
                {
                    i.xspeed = image_xscale * 5;
                }
            }
            break;
        case 11: //Wire Adapter
            if !onSled
            {
                if !instance_exists(objWireAdapter)
                {
                    if !climbing && ground
                    && ((global.keyUp[player_id] && global.GravityDir >= 0) || (global.keyDown[player_id] && global.GravityDir < 0))
                    {
                        fireWeapon(6,-8,objWireAdapter,0,2,1,0);
                    }
                }
                else
                {
                    if objWireAdapter.phase >= 2
                    {
                        i = fireWeapon(16,0,objBusterShot,4,0,1,0);
                        if i
                        {
                            i.xspeed = image_xscale * 5;
                        }
                    }
                }
            }
            break;
        case 12: //Super Arrow
            fireWeapon(22,0,objSuperArrow,3,2,1,0);
            break;
    }
}

if isShoot //While shooting
{
    if shootStandstill
    {
        if !ground && !climbing {
            canMove = true;
        }
        
        if ground && !climbing
        {
            canMove = false;
            xspeed = 0;
        }
    }    
    
    shootTimer += 1;
    if shootTimer >= 16 //20 looks better, but 16 is more acurrate
    {
        isShoot = 0;
        if shootStandstill
        {
            shootStandstill = false;
            if ground
            {
                canMove = true;
            }
        }
    }
}

//Charging
if global.enableCharge && canShoot && global.weapon[player_id] == 0 && !global.lockBuster
{
    if (global.keyShoot[player_id] || (isSlide && chargeTimer != 0))
    {
        if (canMove || isSlide || climbing) && !isShoot
        {
            isCharge = true;
            if !isSlide {
                initChargeTimer += 1;
            }
            if initChargeTimer >= initChargeTime {
                chargeTimer += 1;
                if chargeTimer == 1 {
                    playSFX(sfxCharging);
                }
                if chargeTimer < chargeTime {
                    var chargeTimeDiv, chargeCol;
                    chargeTimeDiv = round(chargeTime / 3);
                    if chargeTimer < chargeTimeDiv {
                        chargeCol = make_color_rgb(168, 0, 32);     //Dark red
                    }
                    else if chargeTimer < chargeTimeDiv * 2 {
                        chargeCol = make_color_rgb(228, 0, 88);     //Red (dark pink)
                    }
                    else {
                        chargeCol = make_color_rgb(248, 88, 152);   //Light red (pink)
                    }
                    if chargeTimer mod 6 >= 0 && chargeTimer mod 6 < 3 {
                        global.outlineCol[player_id] = chargeCol;
                    }
                    else {
                        global.outlineCol[player_id] = c_black;
                    }
                }
                else {
                    if chargeTimer == chargeTime {
                        audio_stop_sound(sfxCharging);
                        playSFX(sfxCharged);
                    }
                    switch (floor(chargeTimer/3 mod 3))
                    {
                        case 0: //Light blue helmet, black shirt, blue outline
                            global.primaryCol[player_id] = rocksecondaryCol;
                            global.secondaryCol[player_id] = c_black;
                            global.outlineCol[player_id] = rockprimaryCol;
                            break;
                        case 1: //Black helmet, blue shirt, light blue outline
                            global.primaryCol[player_id] = c_black;
                            global.secondaryCol[player_id] = rockprimaryCol;
                            global.outlineCol[player_id] = rocksecondaryCol;
                            break;
                        case 2: //Blue helmet, light blue shirt, blue outline
                            global.primaryCol[player_id] = rockprimaryCol;
                            global.secondaryCol[player_id] = rocksecondaryCol;
                            global.outlineCol[player_id] = c_black;
                            break;
                    }
                }
            }
        }
    }
    else if !global.keyShoot[player_id] //Release the charge shot
    {
        if (canMove || climbing) && chargeTimer != 0
        {
            if climbing
            {
                image_xscale = climbShootXscale;
            }
        
            if chargeTimer < chargeTime
            {
                i = fireWeapon(12,0,objBusterShotHalfCharged,3,0,1,0);
                if i
                {
                    i.xspeed = image_xscale * 5;
                }
            }
            else
            {
                i = fireWeapon(20,0,objBusterShotCharged,3,0,1,0);
                if i
                {
                    i.xspeed = image_xscale * 5.5;
                }
            }
            
            chargeTimer = 0;
            initChargeTimer = 0;
            audio_stop_sound(sfxCharged);
            audio_stop_sound(sfxCharging);
            event_user(0); //Reset the colors
        } 
    }
}
