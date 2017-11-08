///playerEndStep

if !global.frozen && !frozen
{
    if platformamount
    {
        ys = yspeed;
        xs = xspeed;
        xspeed = platformspeed/platformamount;
        yspeed = 0;
        playerCollision();
        x += xspeed;
        xspeed = xs;
        yspeed = ys;
        platformamount = 0;
        platformspeed = 0;
    }
    
    //Pausing
    if canPause
    {
        if (global.keyPausePressed[0]) or (keyboard_check_pressed(vk_escape) && global.escapeBehavior == 1)
        {
            if global.playerHealth[player_id] > 0
            {
                global.frozen = true;
                instance_create(x, y, objPauseMenu);
                playSFX(sfxPause);
            }
        }
    }
    
    //Camera
    playerCamera();
}

//Dying
if global.playerHealth[player_id] <= 0
{
    if deathtimer {deathtimer -= 1;}
    
    if !deathtimer
    {
        tpk = instance_number(objMegaman) <= 1;
        if tpk
        {
            audio_stop_all();
            stopMusic();
        }
        
        if !deathByPit
        {
            if deathtimer = -1
            {
                deathtimer = 30;
                global.frozen = true;
                drawHitspark = false;
                event_user(0);
                yspeed = 0;
                xspeed = 0;
                exit;
            }
            
            for (i=0; i<16; i+=1;)
            {
                explosionID = instance_create(x, y, objMegamanExplosion);
                explosionID.dir = i*45;
                explosionID.spd = 0.75*(1+floor(i/8));
            }
        }
        
        if tpk
        {
            objHealthWeaponBar.alarm[0] = 3*room_speed;
        }
        else {global.respawnTimer[player_id] = global.respawnTime*max(1,instance_exists(prtBoss)*global.respawnTimeBoss);}
        
        instance_destroy();
        playSFX(sfxDeath);
        global.frozen = false;
    }
}
