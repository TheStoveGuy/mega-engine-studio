///playerSwitchWeapons()
//Allows for quick weapon switching
//If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event

var left,right;
left = global.keyWeaponSwitchLeftPressed[player_id];
right = global.keyWeaponSwitchRightPressed[player_id];

//Switching to the left
if (left or right) && !teleporting && !showReady
{
    if inWaveBike {playSFX(sfxError); exit;}
    
    if global.keyWeaponSwitchLeft[player_id] && global.keyWeaponSwitchRight[player_id]
    {
        if global.weapon[player_id] != megabuster
        {
            global.weapon[player_id] = 0;
        }
    }
    else
    {
        if right {dir = 1;}
        else {dir = -1;}
        var loops,wpn;
        loops = 0;
        wpn = global.weapon[player_id];
        while !global.weaponUnlocked[wpn] || loops == 0
        {
            wpn += dir;
            if wpn < 0
            {
                wpn = global.totalWeapons;
            }
            if wpn > global.totalWeapons
            {
                wpn = 0;
            }
            loops += 1;
        }
        global.weapon[player_id] = wpn;
    }
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 32;
    event_user(0); //Colors
    
    shootStandstill = false;
    
    with prtPlayerProjectile
    {
        if player_id == other.player_id {instance_destroy();}
    }
    
    if onRushJet
    {
        onRushJet = false;
        canMove = true;
    }
    playSFX(sfxWeaponSwitch);
    
    audio_stop_sound(sfxCharging);
    audio_stop_sound(sfxCharged);
    audio_stop_sound(sfxWheelCutter1);
    audio_stop_sound(sfxWheelCutter2);
}

//Timer
if drawWeaponIconTimer != -1
{
    drawWeaponIconTimer -= 1;
    if drawWeaponIconTimer == 0
    {
        drawWeaponIcon = false;
    }
}
